From: Florian Eckert <fe@dev.tdt.de>
Subject: Re: [PATCH 1/3] platform/x86/pcengines-apuv2: add mpcie reset gpio
 export
Date: Wed, 10 Jul 2019 14:30:02 +0200
Message-ID: <f931d21e19a12e34841da978d10a615e@dev.tdt.de>
References: <20190704090205.19400-1-fe@dev.tdt.de>
 <20190704090205.19400-2-fe@dev.tdt.de>
 <3c469213-f2d7-aa7e-4028-e8ce463a4441@metux.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <3c469213-f2d7-aa7e-4028-e8ce463a4441@metux.net>
Sender: linux-kernel-owner@vger.kernel.org
To: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Cc: Eckert.Florian@googlemail.com, info@metux.net, dvhart@infradead.org, andy@infradead.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On 2019-07-08 21:44, Enrico Weigelt, metux IT consult wrote:
> On 04.07.19 11:02, Florian Eckert wrote:
>> On APUx we have also mpcie2/mpcie3 reset pins. To make it possible to 
>> reset
>> the ports from the userspace, add the definition to this platform
>> device. The gpio can then be exported by the legancy gpio subsystem to
>> toggle the mpcie reset pin.
> 
> Are you sure they're also available on APUv2 (not just v3) ?

We have the following models on APU2 family:
The schematic could be downloaded for all APU2 family boards from this 
side.
See https://www.pcengines.ch/apu2.htm

They all use the similar PCB with some minimal changes.

APU2
2 mpcie slot
apu2d0 (2 GB DRAM, 2 i211AT NICs)
apu2d2 (2 GB DRAM, 3 i211AT NICs)
apu2d4 (4 GB DRAM, 3 i210AT NICs)

J14 (USB + SIM1) PE3_RST to GPIO G51
J13 (USB + SIM2) PE4_RST to GPIO G55

APU3
3 mpcie slot
apu3c2 (2 GB DRAM, 3 i211AT NICs, optimized for 3G/LTE modems)
apu3c4 (4 GB DRAM, 3 i211AT NICs, optimized for 3G/LTE modems)

J16 (PCIe + USB no SIM) not connected to a userland GPIO
J15 (USB SIM1) PE4_RST to GPIO G55
J14 (mSATA or USB SIM2) PE3_RST to GPIO G51

APU4
3 mpcie slot
apu4c2 (2 GB DRAM, 4 i211AT NICs)
apu4c4 (4 GB DRAM, 4 i211AT NICs)

J15 (PCIe + USB no SIM) not connected to a userland GPIO
J14 (USB SIM1) PE4_RST to GPIO G55
J13 (mSATA or USB SIM2) PE3_RST to GPIO G51

Please check again so that I have not done any mistake.

So all USB only mpcie slots could be reseted by a GPIO G51 and G55.

Kind regards

Flo
