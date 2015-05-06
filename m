From: Bryan O'Donoghue <pure.logic@nexus-software.ie>
Subject: Re: [PATCH 0/2] x86/quark: Add eSRAM driver and test code
Date: Wed, 06 May 2015 08:27:07 -0700
Message-ID: <554A32CB.6070509@nexus-software.ie>
References: <1430705875-6990-1-git-send-email-pure.logic@nexus-software.ie> <20150506095235.GA16272@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150506095235.GA16272@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ingo Molnar <mingo2.kernel.org@gmail.com>
Cc: tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com, x86@kernel.org, dvhart@infradead.org, andy.schevchenko@gmail.com, boon.leong.ong@intel.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, derek.browne@intel.com, josef.ahmad@intel.com, erik.nyquist@intel.com
List-Id: platform-driver-x86.vger.kernel.org

On 06/05/15 02:52, Ingo Molnar wrote:
>
> * Bryan O'Donoghue <pure.logic@nexus-software.ie> wrote:
>
>> Quark X1000 SoC contains a 512 KiB embedded SRAM (eSRAM) memory that can
>> be mapped onto an area of DRAM in block or on per-page overlay mode where a
>> 4 KiB aligned region can be overlayed - allowing for broken up mappings
>> with a 4 KiB individual granularity.
>>
>> eSRAM has access times similar to an L1 cache. The following patchset
>> adds a gen_pool driver and automatic test routine to exercise eSRAM. The
>> intent of the eSRAM driver is to allow other drivers to allocate SRAM
>> buffers. In contrast to the original BSP code no attempt will be made to
>> map kernel .data section code, this is a simple SRAM buffer allocation/free
>> mechanism and a sanity test to ensure it's ongoing correctness.
>>
>> Bryan O'Donoghue (2):
>>    x86/quark: Add Quark embedded SRAM support
>>    x86/quark: Add Quark embedded SRAM self-test
>
> So I'm wondering what the primary usecase is for this. The eSRAM API
> is purely in-kernel, right? The only user seems to be the self-test.
> What other users will there be?


I see three to four users.

1. UART with DMA enabled.
2. Ethernet/STMMAC
3. SPI/I2C buffers
4. Potentially UIO

I'm working on a good use-case for UIO but rather than patch-bomb eSRAM 
+ other drivers in one go, I thought I'd get the core in and then do 
some modifications in other drivers to utilize the changes.
