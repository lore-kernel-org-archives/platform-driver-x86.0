From: Sasha Levin <sashal@kernel.org>
Subject: Re: [PATCH AUTOSEL 4.19 17/49] efi/x86/Add missing error handling to
 old_memmap 1:1 mapping code
Date: Wed, 19 Jun 2019 16:58:12 -0400
Message-ID: <20190619205812.GE2226@sasha-vm>
References: <20190608114232.8731-1-sashal@kernel.org>
 <20190608114232.8731-17-sashal@kernel.org>
 <CAKv+Gu9ZJ42=NJWDX4+DgkMWaSEakNw-yYiUtsUE48D-V6=7-w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAKv+Gu9ZJ42=NJWDX4+DgkMWaSEakNw-yYiUtsUE48D-V6=7-w@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, stable <stable@vger.kernel.org>, Gen Zhang <blackgod016574@gmail.com>, Linus Torvalds <torvalds@linux-foundation.org>, Peter Zijlstra <peterz@infradead.org>, Rob Bradford <robert.bradford@intel.com>, Thomas Gleixner <tglx@linutronix.de>, linux-efi <linux-efi@vger.kernel.org>, Ingo Molnar <mingo@kernel.org>, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Sun, Jun 09, 2019 at 08:14:29PM +0200, Ard Biesheuvel wrote:
>On Sat, 8 Jun 2019 at 13:43, Sasha Levin <sashal@kernel.org> wrote:
>>
>> From: Gen Zhang <blackgod016574@gmail.com>
>>
>> [ Upstream commit 4e78921ba4dd0aca1cc89168f45039add4183f8e ]
>>
>> The old_memmap flow in efi_call_phys_prolog() performs numerous memory
>> allocations, and either does not check for failure at all, or it does
>> but fails to propagate it back to the caller, which may end up calling
>> into the firmware with an incomplete 1:1 mapping.
>>
>> So let's fix this by returning NULL from efi_call_phys_prolog() on
>> memory allocation failures only, and by handling this condition in the
>> caller. Also, clean up any half baked sets of page tables that we may
>> have created before returning with a NULL return value.
>>
>> Note that any failure at this level will trigger a panic() two levels
>> up, so none of this makes a huge difference, but it is a nice cleanup
>> nonetheless.
>>
>> [ardb: update commit log, add efi_call_phys_epilog() call on error path]
>>
>> Signed-off-by: Gen Zhang <blackgod016574@gmail.com>
>> Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
>> Cc: Linus Torvalds <torvalds@linux-foundation.org>
>> Cc: Peter Zijlstra <peterz@infradead.org>
>> Cc: Rob Bradford <robert.bradford@intel.com>
>> Cc: Thomas Gleixner <tglx@linutronix.de>
>> Cc: linux-efi@vger.kernel.org
>> Link: http://lkml.kernel.org/r/20190525112559.7917-2-ard.biesheuvel@linaro.org
>> Signed-off-by: Ingo Molnar <mingo@kernel.org>
>> Signed-off-by: Sasha Levin <sashal@kernel.org>
>
>This was already discussed in the thread that proposed this patch for
>stable: please don't queue this right now, the patches are more likely
>to harm than hurt, and they certainly don't fix a security
>vulnerability, as has been claimed.

I've dropped this, thank you.

--
Thanks,
Sasha
