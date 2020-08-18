# frozen_string_literal: true

require 'spec_helper'

describe Avataaars::Processor do
  subject(:processor) { described_class.new Dir.pwd }

  describe '#create_avatar' do
    subject(:create_avatar) { processor.create_avatar options }

    let(:options) { {} }
    let(:image) { MiniMagick::Image.read create_avatar, '.SVG' }

    it 'cleans up the worker process' do
      expect { create_avatar }.not_to(change { `ps | grep node | grep -v 'grep node' | wc -l` })
    end

    it { expect(image.type).to eq 'SVG' }
    it { expect(image.dimensions).to eq [264, 280] }
    it 'returns expected SVG' do
      expect(create_avatar).to eq <<~SVG.strip
        <svg width="264px" height="280px" viewBox="0 0 264 280" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" data-reactroot=""><desc>Created with getavataaars.com</desc><defs><circle id="path-1" cx="120" cy="120" r="120"></circle><path d="M12,160 C12,226.27417 65.72583,280 132,280 C198.27417,280 252,226.27417 252,160 L264,160 L264,-1.42108547e-14 L-3.19744231e-14,-1.42108547e-14 L-3.19744231e-14,160 L12,160 Z" id="path-3"></path><path d="M124,144.610951 L124,163 L128,163 L128,163 C167.764502,163 200,195.235498 200,235 L200,244 L0,244 L0,235 C-4.86974701e-15,195.235498 32.235498,163 72,163 L72,163 L76,163 L76,144.610951 C58.7626345,136.422372 46.3722246,119.687011 44.3051388,99.8812385 C38.4803105,99.0577866 34,94.0521096 34,88 L34,74 C34,68.0540074 38.3245733,63.1180731 44,62.1659169 L44,56 L44,56 C44,25.072054 69.072054,5.68137151e-15 100,0 L100,0 L100,0 C130.927946,-5.68137151e-15 156,25.072054 156,56 L156,62.1659169 C161.675427,63.1180731 166,68.0540074 166,74 L166,88 C166,94.0521096 161.51969,99.0577866 155.694861,99.8812385 C153.627775,119.687011 141.237365,136.422372 124,144.610951 Z" id="path-5"></path></defs><g id="Avataaar" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd"><g transform="translate(-825.000000, -1100.000000)" id="Avataaar/Circle"><g transform="translate(825.000000, 1100.000000)"><g id="Mask"></g><g id="Avataaar" stroke-width="1" fill-rule="evenodd" mask="url(#mask-4)"><g id="Body" transform="translate(32.000000, 36.000000)"><mask id="mask-6" fill="white"><use xlink:href="#path-5"></use></mask><use fill="#D0C6AC" xlink:href="#path-5"></use><g id="Skin/👶🏽-03-Brown" mask="url(#mask-6)" fill="#EDB98A"><g transform="translate(0.000000, 0.000000)" id="Color"><rect x="0" y="0" width="264" height="280"></rect></g></g><path d="M156,79 L156,102 C156,132.927946 130.927946,158 100,158 C69.072054,158 44,132.927946 44,102 L44,79 L44,94 C44,124.927946 69.072054,150 100,150 C130.927946,150 156,124.927946 156,94 L156,79 Z" id="Neck-Shadow" fill-opacity="0.100000001" fill="#000000" mask="url(#mask-6)"></path></g><g id="Clothing/Blazer-+-Shirt" transform="translate(0.000000, 170.000000)"><defs><path d="M133.960472,0.294916112 C170.936473,3.32499816 200,34.2942856 200,72.0517235 L200,81 L0,81 L0,72.0517235 C1.22536245e-14,33.9525631 29.591985,2.76498122 67.0454063,0.219526408 C67.0152598,0.593114549 67,0.969227185 67,1.34762511 C67,13.2107177 81.9984609,22.8276544 100.5,22.8276544 C119.001539,22.8276544 134,13.2107177 134,1.34762511 C134,0.994669088 133.986723,0.64370138 133.960472,0.294916112 Z" id="react-path-1"></path></defs><g id="Shirt" transform="translate(32.000000, 29.000000)"><mask id="react-mask-2" fill="white"><use xlink:href="#react-path-1"></use></mask><use id="Clothes" fill="#E6E6E6" xlink:href="#react-path-1"></use><g id="Color/Palette/Black" mask="url(#react-mask-2)" fill="#262E33"><g transform="translate(-32.000000, -29.000000)" id="🖍Color"><rect x="0" y="0" width="264" height="110"></rect></g></g><g id="Shadowy" opacity="0.599999964" mask="url(#react-mask-2)" fill-opacity="0.16" fill="#000000"><g transform="translate(60.000000, -25.000000)" id="Hola-👋🏼"><ellipse cx="40.5" cy="27.8476251" rx="39.6351047" ry="26.9138272"></ellipse></g></g></g><g id="Blazer" transform="translate(32.000000, 28.000000)"><path d="M68.784807,1.12222847 C30.512317,2.80409739 -1.89486556e-14,34.3646437 -1.42108547e-14,73.0517235 L0,73.0517235 L0,82 L69.3616767,82 C65.9607412,69.9199941 64,55.7087296 64,40.5 C64,26.1729736 65.7399891,12.7311115 68.784807,1.12222847 Z M131.638323,82 L200,82 L200,73.0517235 C200,34.7067641 170.024954,3.36285166 132.228719,1.17384225 C135.265163,12.7709464 137,26.1942016 137,40.5 C137,55.7087296 135.039259,69.9199941 131.638323,82 Z" id="Saco" fill="#3A4C5A"></path><path d="M149,58 L158.555853,50.83311 L158.555853,50.83311 C159.998897,49.7508275 161.987779,49.7682725 163.411616,50.8757011 L170,56 L149,58 Z" id="Pocket-hanky" fill="#E6E6E6"></path><path d="M69,1.13686838e-13 C65,19.3333333 66.6666667,46.6666667 74,82 L58,82 L44,46 L50,37 L44,31 L63,1 C65.027659,0.369238637 67.027659,0.0359053037 69,1.13686838e-13 Z" id="Wing" fill="#2F4351"></path><path d="M151,1.13686838e-13 C147,19.3333333 148.666667,46.6666667 156,82 L140,82 L126,46 L132,37 L126,31 L145,1 C147.027659,0.369238637 149.027659,0.0359053037 151,1.13686838e-13 Z" id="Wing" fill="#2F4351" transform="translate(141.000000, 41.000000) scale(-1, 1) translate(-141.000000, -41.000000) "></path></g></g><g id="Face" transform="translate(76.000000, 82.000000)" fill="#000000"><g id="Mouth/Default" transform="translate(2.000000, 52.000000)" fill-opacity="0.699999988"><path d="M40,15 C40,22.7319865 46.2680135,29 54,29 L54,29 C61.7319865,29 68,22.7319865 68,15" id="Mouth"></path></g><g id="Nose/Default" transform="translate(28.000000, 40.000000)" fill-opacity="0.16"><path d="M16,8 C16,12.418278 21.372583,16 28,16 L28,16 C34.627417,16 40,12.418278 40,8" id="Nose"></path></g><g id="Eyes/Default-😀" transform="translate(0.000000, 8.000000)" fill-opacity="0.599999964"><circle id="Eye" cx="30" cy="22" r="6"></circle><circle id="Eye" cx="82" cy="22" r="6"></circle></g><g id="Eyebrow/Outline/Default" fill-opacity="0.599999964"><g id="I-Browse" transform="translate(12.000000, 6.000000)"><path d="M3.63024536,11.1585767 C7.54515501,5.64986673 18.2779197,2.56083721 27.5230268,4.83118046 C28.5957248,5.0946055 29.6788665,4.43856013 29.9422916,3.36586212 C30.2057166,2.2931641 29.5496712,1.21002236 28.4769732,0.94659732 C17.7403633,-1.69001789 5.31209962,1.88699832 0.369754639,8.84142326 C-0.270109626,9.74178291 -0.0589363917,10.9903811 0.84142326,11.6302454 C1.74178291,12.2701096 2.9903811,12.0589364 3.63024536,11.1585767 Z" id="Eyebrow" fill-rule="nonzero"></path><path d="M61.6302454,11.1585767 C65.545155,5.64986673 76.2779197,2.56083721 85.5230268,4.83118046 C86.5957248,5.0946055 87.6788665,4.43856013 87.9422916,3.36586212 C88.2057166,2.2931641 87.5496712,1.21002236 86.4769732,0.94659732 C75.7403633,-1.69001789 63.3120996,1.88699832 58.3697546,8.84142326 C57.7298904,9.74178291 57.9410636,10.9903811 58.8414233,11.6302454 C59.7417829,12.2701096 60.9903811,12.0589364 61.6302454,11.1585767 Z" id="Eyebrow" fill-rule="nonzero" transform="translate(73.000154, 6.039198) scale(-1, 1) translate(-73.000154, -6.039198) "></path></g></g></g><g id="Top" stroke-width="1" fill-rule="evenodd"><defs><rect id="react-path-5" x="0" y="0" width="264" height="280"></rect><path d="M133.506381,81.3351151 C137.363649,83.3307002 140,87.3574737 140,92 L140,105 C140,111.018625 135.569129,116.002364 129.791419,116.867187 C128.048193,137.114792 115.530782,154.282984 98,162.610951 L98,162.610951 L98,181 L102,181 C119.490913,181 135.525121,187.236892 148,197.608051 L148,74 C148,53.5654643 139.717268,35.0654643 126.325902,21.6740982 C112.934536,8.28273213 94.4345357,-3.55271368e-15 74,0 C33.1309285,7.10542736e-15 -7.10542736e-15,33.1309285 0,74 L0,257.716445 C13.5691766,255.775526 24,244.105888 24,230 L24,184.423101 C30.9346808,182.200199 38.3271796,181 46,181 L50,181 L50,162.610951 C38.7726252,157.277407 29.6015372,148.317951 24,137.245847 L24,75.2659587 C33.1467898,72.2910056 42.777598,68.0170651 52.3415164,62.4953343 C67.7445474,53.6023901 80.4313947,42.9409152 89.0661426,32.3970356 C90.8310687,37.5951441 93.1752556,42.8009742 96.1104311,47.8848473 C104.877881,63.0705152 117.224186,74.2337047 130,79.9170491 L130,80.1659169 C130.400422,80.233095 130.794121,80.3201038 131.18005,80.4258987 C131.954509,80.7493055 132.730185,81.0524853 133.506381,81.3351151 Z" id="react-path-6"></path></defs><mask id="react-mask-3" fill="white"><use xlink:href="#react-path-5"></use></mask><g id="Mask"></g><g id="Top/Long-Hair/Straight" mask="url(#react-mask-3)"><g transform="translate(-1.000000, 0.000000)"><g id="Hair" stroke-width="1" fill="none" fill-rule="evenodd" transform="translate(59.000000, 18.000000)"><mask id="react-mask-4" fill="white"><use xlink:href="#react-path-6"></use></mask><use id="Mask-Hair" fill="#944F23" xlink:href="#react-path-6"></use><g id="Skin/👶🏽-03-Brown" mask="url(#react-mask-4)" fill="#4A312C"><g transform="translate(0.000000, 0.000000) " id="Color"><rect x="0" y="0" width="264" height="280"></rect></g></g></g><path d="M192.506381,99.3351151 C197.3745,101.107702 202.263079,102.071957 207,102.148232 L207,102.148232 L207,92 C207,71.5654643 198.717268,53.0654643 185.325902,39.6740982 C198.717268,53.0654643 207,71.5654643 207,92 L207,215.608051 C194.525121,205.236892 178.490913,199 161,199 L157,199 L157,180.610951 L157,180.610951 C174.530782,172.282984 187.048193,155.114792 188.791419,134.867187 C194.569129,134.002364 199,129.018625 199,123 L199,110 C199,105.357474 196.363649,101.3307 192.506381,99.3351151 Z M190.18005,98.4258987 C189.794121,98.3201038 189.400422,98.233095 189,98.1659169 L189,97.9170491 C189.392974,98.0918644 189.786355,98.2614951 190.18005,98.4258987 Z M83,155.245847 C88.6015372,166.317951 97.7726252,175.277407 109,180.610951 L109,199 L105,199 C97.3271796,199 89.9346808,200.200199 83,202.423101 L83,155.245847 Z" id="Shadow" fill-opacity="0.24" fill="#000000" fill-rule="evenodd"></path></g></g></g></g></g></g></g></svg>
      SVG
    end

    context 'when puppeteer package is not installed' do
      # Temporarily move the node avataaars folder
      before { FileUtils.move 'node_modules/avataaars', 'node_modules/avataaars_temp' }

      after { FileUtils.move 'node_modules/avataaars_temp', 'node_modules/avataaars' }

      it 'raises a DependencyError' do
        expect { create_avatar }.to raise_error Avataaars::DependencyError, Avataaars::Utils.squish(<<~ERROR)
          Cannot find module 'avataaars'.
          The module was found in '#{Dir.pwd}/package.json' however, please run 'npm install' from '#{Dir.pwd}'
        ERROR
      end

      context 'when avataaars package is not in package.json' do
        before do
          FileUtils.copy 'package.json', 'package.json.tmp'
          IO.write('package.json', File.open('package.json') { |f| f.read.gsub(/"avataaars"/, '"avataaars-tmp"') })
        end

        after { FileUtils.move 'package.json.tmp', 'package.json' }

        it 'raises a DependencyError' do
          expect { create_avatar }.to raise_error Avataaars::DependencyError, Avataaars::Utils.squish(<<~ERROR)
            Cannot find module 'avataaars'.
            You need to add it to '#{Dir.pwd}/package.json' and run 'npm install'
          ERROR
        end
      end
    end

    context 'when stubbing the call to the Node processor' do
      let(:stdin) { instance_double 'IO' }
      let(:stdout) { instance_double 'IO' }
      let(:stderr) { instance_double 'IO' }
      let(:wait_thr) { instance_double 'Process::Waiter' }

      before do
        allow(Open3).to(
          receive(:popen3)
            .with('node', File.expand_path(File.join(__dir__, '../../lib/avataaars/js/processor.js')), chdir: Dir.pwd)
            .and_return([stdin, stdout, stderr, wait_thr])
        )

        allow(stdin).to receive(:close)
        allow(stdout).to receive(:close)
        allow(stderr).to receive(:close)
        allow(wait_thr).to receive(:join)
      end

      context 'when first call to gets on stdout returns nil' do
        before do
          allow(stdout).to receive(:gets).and_return nil
          allow(stderr).to receive(:read).and_return 'The reason the worker failed'
        end

        it 'raises an Error' do
          expect { create_avatar }.to raise_error Avataaars::Error, <<~ERROR.strip
            Failed to instantiate worker process:
            The reason the worker failed
          ERROR
        end
      end

      context 'when first call to gets on stdout succeeds but second returns nil' do
        before do
          allow(stdout).to receive(:gets).and_return '["ok"]', nil
          expect(stdin).to receive(:puts).with '[{}]'
          allow(stderr).to receive(:read).and_return 'The reason the worker failed'
        end

        it 'raises an Error' do
          expect { create_avatar }.to raise_error Avataaars::Error, <<~ERROR.strip
            Worker process failed:
            The reason the worker failed
          ERROR
        end
      end

      context 'when first call to gets on stdout succeeds but second returns an error' do
        before do
          allow(stdout).to receive(:gets).and_return '["ok"]', '["err","Some unknown thing happened"]'
          allow(stdin).to receive(:puts).with '[{}]'
          allow(stderr).to receive(:read).and_return 'The reason the worker failed'
        end

        it 'raises a JavaScript UnknownError' do
          expect { create_avatar }.to raise_error Avataaars::JavaScript::UnknownError, 'Some unknown thing happened'
        end
      end

      context 'when the call to launch Node raises an error' do
        it 'raises the error' do
          expect(Open3).to receive(:popen3).and_raise Errno::ENOENT, 'node'

          expect { create_avatar }.to raise_error Errno::ENOENT, 'No such file or directory - node'
        end
      end
    end

    context 'when passing through options to Avataaars' do
      let(:options) do
        {
          'avatarStyle' => 'Circle',
          'topType' => 'ShortHairShortFlat',
          'hairColor' => 'BrownDark',
          'accessoriesType' => 'Round',
          'facialHairType' => 'BeardMedium',
          'facialHairColor' => 'Auburn',
          'clotheType' => 'Hoodie',
          'clotheColor' => 'PastelGreen',
          'eyeType' => 'Surprised',
          'eyebrowType' => 'UpDown',
          'mouthType' => 'Disbelief',
          'skinColor' => 'Brown'
        }
      end

      it { expect(image.type).to eq 'SVG' }
      it { expect(image.dimensions).to eq [264, 280] }
      it 'returns expected SVG' do
        expect(create_avatar).to eq <<~SVG.strip
          <svg width="264px" height="280px" viewBox="0 0 264 280" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" data-reactroot=""><desc>Created with getavataaars.com</desc><defs><circle id="path-1" cx="120" cy="120" r="120"></circle><path d="M12,160 C12,226.27417 65.72583,280 132,280 C198.27417,280 252,226.27417 252,160 L264,160 L264,-1.42108547e-14 L-3.19744231e-14,-1.42108547e-14 L-3.19744231e-14,160 L12,160 Z" id="path-3"></path><path d="M124,144.610951 L124,163 L128,163 L128,163 C167.764502,163 200,195.235498 200,235 L200,244 L0,244 L0,235 C-4.86974701e-15,195.235498 32.235498,163 72,163 L72,163 L76,163 L76,144.610951 C58.7626345,136.422372 46.3722246,119.687011 44.3051388,99.8812385 C38.4803105,99.0577866 34,94.0521096 34,88 L34,74 C34,68.0540074 38.3245733,63.1180731 44,62.1659169 L44,56 L44,56 C44,25.072054 69.072054,5.68137151e-15 100,0 L100,0 L100,0 C130.927946,-5.68137151e-15 156,25.072054 156,56 L156,62.1659169 C161.675427,63.1180731 166,68.0540074 166,74 L166,88 C166,94.0521096 161.51969,99.0577866 155.694861,99.8812385 C153.627775,119.687011 141.237365,136.422372 124,144.610951 Z" id="path-5"></path></defs><g id="Avataaar" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd"><g transform="translate(-825.000000, -1100.000000)" id="Avataaar/Circle"><g transform="translate(825.000000, 1100.000000)"><g id="Circle" stroke-width="1" fill-rule="evenodd" transform="translate(12.000000, 40.000000)"><mask id="mask-2" fill="white"><use xlink:href="#path-1"></use></mask><use id="Circle-Background" fill="#E6E6E6" xlink:href="#path-1"></use><g id="Color/Palette/Blue-01" mask="url(#mask-2)" fill="#65C9FF"><rect id="🖍Color" x="0" y="0" width="240" height="240"></rect></g></g><mask id="mask-4" fill="white"><use xlink:href="#path-3"></use></mask><g id="Mask"></g><g id="Avataaar" stroke-width="1" fill-rule="evenodd" mask="url(#mask-4)"><g id="Body" transform="translate(32.000000, 36.000000)"><mask id="mask-6" fill="white"><use xlink:href="#path-5"></use></mask><use fill="#D0C6AC" xlink:href="#path-5"></use><g id="Skin/👶🏽-03-Brown" mask="url(#mask-6)" fill="#D08B5B"><g transform="translate(0.000000, 0.000000)" id="Color"><rect x="0" y="0" width="264" height="280"></rect></g></g><path d="M156,79 L156,102 C156,132.927946 130.927946,158 100,158 C69.072054,158 44,132.927946 44,102 L44,79 L44,94 C44,124.927946 69.072054,150 100,150 C130.927946,150 156,124.927946 156,94 L156,79 Z" id="Neck-Shadow" fill-opacity="0.100000001" fill="#000000" mask="url(#mask-6)"></path></g><g id="Clothing/Hoodie" transform="translate(0.000000, 170.000000)"><defs><path d="M108,13.0708856 C90.0813006,15.075938 76.2798424,20.5518341 76.004203,34.6449676 C50.1464329,45.5680933 32,71.1646257 32,100.999485 L32,100.999485 L32,110 L232,110 L232,100.999485 C232,71.1646257 213.853567,45.5680933 187.995797,34.6449832 C187.720158,20.5518341 173.918699,15.075938 156,13.0708856 L156,32 L156,32 C156,45.254834 145.254834,56 132,56 L132,56 C118.745166,56 108,45.254834 108,32 L108,13.0708856 Z" id="react-path-1"></path></defs><mask id="react-mask-2" fill="white"><use xlink:href="#react-path-1"></use></mask><use id="Hoodie" fill="#B7C1DB" fill-rule="evenodd" xlink:href="#react-path-1"></use><g id="Color/Palette/Gray-01" mask="url(#react-mask-2)" fill-rule="evenodd" fill="#A7FFC4"><rect id="🖍Color" x="0" y="0" width="264" height="110"></rect></g><path d="M102,61.7390531 L102,110 L95,110 L95,58.1502625 C97.2037542,59.4600576 99.5467694,60.6607878 102,61.7390531 Z M169,58.1502625 L169,98.5 C169,100.432997 167.432997,102 165.5,102 C163.567003,102 162,100.432997 162,98.5 L162,61.7390531 C164.453231,60.6607878 166.796246,59.4600576 169,58.1502625 Z" id="Straps" fill="#F4F4F4" fill-rule="evenodd" mask="url(#react-mask-2)"></path><path d="M90.9601329,12.7243537 C75.9093095,15.5711782 65.5,21.2428847 65.5,32.3076923 C65.5,52.0200095 98.5376807,68 132,68 C165.462319,68 198.5,52.0200095 198.5,32.3076923 C198.5,21.2428847 188.09069,15.5711782 173.039867,12.7243537 C182.124921,16.0744598 188,21.7060546 188,31.0769231 C188,51.4689754 160.178795,68 132,68 C103.821205,68 76,51.4689754 76,31.0769231 C76,21.7060546 81.8750795,16.0744598 90.9601329,12.7243537 Z" id="Shadow" fill-opacity="0.16" fill="#000000" fill-rule="evenodd" mask="url(#react-mask-2)"></path></g><g id="Face" transform="translate(76.000000, 82.000000)" fill="#000000"><g id="Mouth/Disbelief" transform="translate(2.000000, 52.000000)" fill-opacity="0.699999988" fill="#000000"><path d="M40,15 C40,22.7319865 46.2680135,29 54,29 L54,29 C61.7319865,29 68,22.7319865 68,15" id="Mouth" transform="translate(54.000000, 22.000000) scale(1, -1) translate(-54.000000, -22.000000) "></path></g><g id="Nose/Default" transform="translate(28.000000, 40.000000)" fill-opacity="0.16"><path d="M16,8 C16,12.418278 21.372583,16 28,16 L28,16 C34.627417,16 40,12.418278 40,8" id="Nose"></path></g><g id="Eyes/Surprised-😳" transform="translate(0.000000, 8.000000)"><circle id="The-White-Stuff" fill="#FFFFFF" cx="30" cy="22" r="14"></circle><circle id="Eye-Ball" fill="#FFFFFF" cx="82" cy="22" r="14"></circle><circle id="Eye" fill-opacity="0.699999988" fill="#000000" cx="30" cy="22" r="6"></circle><circle id="Eye" fill-opacity="0.699999988" fill="#000000" cx="82" cy="22" r="6"></circle></g><g id="Eyebrow/Outline/Up-Down" fill-opacity="0.599999964" fill-rule="nonzero"><path d="M15.5914402,14.1619718 C20.0874642,7.83556966 29.6031809,4.65350252 39.3473715,7.79575991 C40.3986323,8.13476518 41.5256656,7.55736801 41.8646708,6.50610724 C42.2036761,5.45484647 41.6262789,4.32781316 40.5750182,3.98880789 C29.1665516,0.309863172 17.8358054,4.09887835 12.3309495,11.8448183 C11.6910852,12.7451779 11.9022584,13.9937761 12.8026181,14.6336404 C13.7029777,15.2735046 14.9515759,15.0623314 15.5914402,14.1619718 Z" id="Eyebrow"></path><path d="M73.6376405,21.1577995 C77.5525501,15.6490895 88.2853148,12.56006 97.5304219,14.8304032 C98.6031199,15.0938282 99.6862617,14.4377829 99.9496867,13.3650849 C100.213112,12.2923868 99.5570664,11.2092451 98.4843684,10.9458201 C87.7477584,8.30920485 75.3194947,11.8862211 70.3771498,18.840646 C69.7372855,19.7410057 69.9484587,20.9896038 70.8488184,21.6294681 C71.749178,22.2693324 72.9977762,22.0581591 73.6376405,21.1577995 Z" id="Eyebrow" transform="translate(85.007549, 16.038421) scale(-1, 1) translate(-85.007549, -16.038421) "></path></g></g><g id="Top" stroke-width="1" fill-rule="evenodd"><defs><rect id="react-path-7" x="0" y="0" width="264" height="280"></rect><path d="M180.14998,39.9204083 C177.390206,37.1003988 174.185913,34.7068297 171.069252,32.3065503 C170.381566,31.777442 169.682843,31.2610833 169.010544,30.7118441 C168.857687,30.5870323 167.291999,29.4657388 167.104691,29.0530544 C166.653816,28.0602634 166.915042,28.8332916 166.977255,27.6485857 C167.055857,26.150508 170.11064,21.9193194 167.831176,20.9490079 C166.828413,20.522232 165.039628,21.6579526 164.077671,22.0330592 C162.196235,22.7671676 160.291721,23.3932399 158.346734,23.9330847 C159.278588,22.0763407 161.055333,18.3594977 157.71591,19.3543018 C155.114345,20.1293431 152.690052,22.1219709 150.075777,23.0594018 C150.940735,21.6415124 154.399901,17.2479341 151.274209,17.0023366 C150.301549,16.925839 147.471201,18.7503735 146.423952,19.1395717 C143.287223,20.3054888 140.083264,21.0590571 136.789999,21.6525844 C125.59203,23.6707114 112.497238,23.0953019 102.1368,28.1934632 C94.1494796,32.1236942 86.262502,38.2220278 81.648386,45.987539 C77.2011742,53.472559 75.537818,61.6641751 74.6069673,70.2412987 C73.9239644,76.535909 73.8684412,83.0425652 74.1878671,89.3599905 C74.2922241,91.4297869 74.5250203,100.970847 77.5319724,98.0813859 C79.0300967,96.641688 79.019059,90.8282073 79.3963495,88.8604076 C80.1472513,84.9452748 80.870057,81.0126951 82.122006,77.2227096 C84.3282191,70.5439339 86.9307879,63.4296587 92.4269209,58.8297383 C95.9539853,55.8782066 98.4307906,51.8889248 101.806002,48.9112229 C103.322188,47.5738572 102.165231,47.7130963 104.602902,47.888571 C106.240504,48.006337 107.885464,48.0512961 109.52641,48.0942421 C113.322394,48.1928837 117.124399,48.16772 120.921387,48.1811407 C128.56821,48.208653 136.179243,48.316689 143.818708,47.9164188 C147.213653,47.7385955 150.617965,47.6423024 154.00388,47.3282597 C155.895349,47.152785 159.251496,45.9405668 160.808488,46.8669256 C162.233362,47.7144383 163.71309,50.4817719 164.736257,51.615144 C167.153525,54.2935659 170.035717,56.3392052 172.862385,58.5354911 C178.756547,63.114945 181.732392,68.8666908 183.522515,76.023241 C185.305949,83.1532854 184.805905,89.76815 187.013456,96.78479 C187.401784,98.0184813 188.428965,100.14498 189.695296,98.2389151 C189.930434,97.8849461 189.869559,95.9390277 189.869559,94.819339 C189.869559,90.2995934 191.014141,86.9083772 190.999758,82.3591197 C190.943566,68.5271489 190.49637,50.4908308 180.14998,39.9204083 Z" id="react-path-6"></path><filter x="-0.8%" y="-2.0%" width="101.5%" height="108.0%" filterUnits="objectBoundingBox" id="react-filter-3"><feOffset dx="0" dy="2" in="SourceAlpha" result="shadowOffsetOuter1"></feOffset><feColorMatrix values="0 0 0 0 0   0 0 0 0 0   0 0 0 0 0  0 0 0 0.16 0" type="matrix" in="shadowOffsetOuter1" result="shadowMatrixOuter1"></feColorMatrix><feMerge><feMergeNode in="shadowMatrixOuter1"></feMergeNode><feMergeNode in="SourceGraphic"></feMergeNode></feMerge></filter></defs><mask id="react-mask-5" fill="white"><use xlink:href="#react-path-7"></use></mask><g id="Mask"></g><g id="Top/Short-Hair/Short-Flat" mask="url(#react-mask-5)"><g transform="translate(-1.000000, 0.000000)"><g id="Facial-Hair/Beard-Medium" transform="translate(49.000000, 72.000000)"><defs><path d="M105.017591,94.1296214 C101.150441,99.7213834 98.257542,95.9467308 94.1374777,92.8762163 C91.6567227,91.0272796 87.9608129,88.7275108 84.5044337,88.8410391 C81.0477114,88.7275108 77.3518016,91.0272796 74.8710466,92.8762163 C70.7509822,95.9467308 67.8580835,99.7213834 63.9909333,94.1296214 C61.0884259,89.9323547 62.3028943,82.8739117 65.014944,78.9027173 C68.8738581,73.2512381 74.1088724,75.9847769 79.9622738,75.3400279 C81.5538829,75.1648137 83.1526985,74.7228407 84.5044337,74 C85.856169,74.7228407 87.4546414,75.1648137 89.0462504,75.3400279 C94.899995,75.9847769 100.134666,73.2512381 103.993923,78.9027173 C106.70563,82.8739117 107.920098,89.9323547 105.017591,94.1296214 M140.39109,26 C136.966521,40.0748212 135.393023,54.4337754 132.909944,68.6711471 C132.392536,71.6390145 131.826063,74.5963095 131.224594,77.5496398 C131.098329,78.1697764 130.973781,80.4725746 130.362704,80.7643064 C128.511632,81.6484223 124.739149,76.9466834 123.730409,75.8851496 C121.196893,73.219256 118.684993,70.5292442 115.599415,68.437233 C109.364783,64.2102603 102.065485,61.7108818 94.4700836,61.117837 C91.2922091,60.8693859 86.9951134,61.3025234 84.000116,63.1104016 C81.0051185,61.3025234 76.7080229,60.8693859 73.5298053,61.117837 C65.9344039,61.7108818 58.6351055,64.2102603 52.4004739,68.437233 C49.3148957,70.5292442 46.8033387,73.219256 44.2694796,75.8851496 C43.2607395,76.9466834 39.4882573,81.6484223 37.6371849,80.7643064 C37.0261079,80.4725746 36.9015594,78.1697764 36.7752954,77.5496398 C36.1738255,74.5963095 35.6073527,71.6390145 35.0899445,68.6711471 C32.6072086,54.4337754 31.0337113,40.0748212 27.6091415,26 C26.6127533,26 25.7385119,44.7478165 25.6273446,46.4945731 C25.174784,53.5889755 24.6463963,60.5254529 25.3216346,67.6261326 C26.485803,79.8749043 27.6993791,95.2339402 37.032627,104.58753 C45.4659003,113.039493 57.7103052,114.806417 68.2713185,120.141327 C69.631059,120.828202 71.4347824,121.676306 73.3798667,122.37111 C75.4289129,123.934171 79.4926946,125 84.1740722,125 C89.0846465,125 93.3155222,123.827456 95.2540874,122.137856 C96.9548781,121.49261 98.5180822,120.752874 99.7285704,120.141327 C110.288776,114.805245 122.533989,113.039493 130.967262,104.58753 C140.30051,95.2339402 141.514086,79.8749043 142.678597,67.6261326 C143.353493,60.5254529 142.825105,53.5889755 142.372887,46.4945731 C142.261377,44.7478165 141.387136,26 140.39109,26 Z" id="react-path-9"></path></defs><mask id="react-mask-8" fill="white"><use xlink:href="#react-path-9"></use></mask><use id="Beardness" fill="#252E32" fill-rule="evenodd" xlink:href="#react-path-9"></use><g id="Color/Hair/Brown" mask="url(#react-mask-8)" fill="#A55728"><g transform="translate(-32.000000, 0.000000)" id="Color"><rect x="0" y="0" width="264" height="244"></rect></g></g></g><mask id="react-mask-4" fill="white"><use xlink:href="#react-path-6"></use></mask><use id="Short-Hair" stroke="none" fill="#1F3140" fill-rule="evenodd" xlink:href="#react-path-6"></use><g id="Skin/👶🏽-03-Brown" mask="url(#react-mask-4)" fill="#4A312C"><g transform="translate(0.000000, 0.000000) " id="Color"><rect x="0" y="0" width="264" height="280"></rect></g></g><g id="Top/_Resources/Round" fill="none" transform="translate(62.000000, 85.000000)"><defs><path d="M80.4646192,16.3941179 C84.3801509,8.45869677 92.552602,3 102,3 C110.919691,3 118.702887,7.86591082 122.839921,15.0880638 C123.050197,15.0306504 123.271519,15 123.5,15 L131.5,15 C132.880712,15 134,16.1192881 134,17.5 C134,18.8807119 132.880712,20 131.5,20 L124.963126,20 C125.637355,22.2145921 126,24.5649459 126,27 C126,40.254834 115.254834,51 102,51 C88.745166,51 78,40.254834 78,27 C78,25.5781066 78.1236513,24.1850936 78.3607874,22.8311273 C78.2762458,18.4553035 74.9135957,15 70.8624171,15 C67.1256697,15 63.9747186,17.9397535 63.4417635,21.8300629 C63.8073299,23.4951922 64,25.2250958 64,27 C64,40.254834 53.254834,51 40,51 C26.745166,51 16,40.254834 16,27 C16,24.5649459 16.3626451,22.2145921 17.0368738,20 L10.5,20 C9.11928813,20 8,18.8807119 8,17.5 C8,16.1192881 9.11928813,15 10.5,15 L10.5,15 L18.5,15 C18.728481,15 18.9498033,15.0306504 19.1600793,15.0880638 C23.2971127,7.86591082 31.0803092,3 40,3 C49.3521568,3 57.4549431,8.34919095 61.415666,16.15488 C63.4929212,13.0392725 66.9494432,11 70.8624171,11 C74.8746823,11 78.4070368,13.1440781 80.4646192,16.3941179 Z M40,47 C51.045695,47 60,38.045695 60,27 C60,15.954305 51.045695,7 40,7 C28.954305,7 20,15.954305 20,27 C20,38.045695 28.954305,47 40,47 Z M102,47 C113.045695,47 122,38.045695 122,27 C122,15.954305 113.045695,7 102,7 C90.954305,7 82,15.954305 82,27 C82,38.045695 90.954305,47 102,47 Z" id="react-path-10"></path><filter x="-0.8%" y="-2.1%" width="101.6%" height="108.3%" filterUnits="objectBoundingBox" id="react-filter-11"><feOffset dx="0" dy="2" in="SourceAlpha" result="shadowOffsetOuter1"></feOffset><feColorMatrix values="0 0 0 0 0   0 0 0 0 0   0 0 0 0 0  0 0 0 0.1 0" type="matrix" in="shadowOffsetOuter1"></feColorMatrix></filter></defs><g id="Lennon-Glasses"><use fill="black" fill-opacity="1" filter="url(#react-filter-11)" xlink:href="#react-path-10"></use><use fill="#252C2F" fill-rule="evenodd" xlink:href="#react-path-10"></use></g></g></g></g></g></g></g></g></g></svg>
        SVG
      end
    end
  end
end
