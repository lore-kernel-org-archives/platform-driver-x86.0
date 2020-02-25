From: Tom Lendacky <thomas.lendacky@amd.com>
Subject: Re: [PATCH v2] x86/efi: Add additional efi tables for unencrypted
 mapping checks
Date: Tue, 25 Feb 2020 13:21:35 -0600
Message-ID: <b2374776-6499-0b99-9df0-b17a4d84b0e4@amd.com>
References: <261ea8108c6290e95962be2638bd204f90787c1c.1582652466.git.thomas.lendacky@amd.com>
 <CAKv+Gu_FJeiaY5yw9=ER4XyBZrDFZ5L4igrqxP6hhJ7Z8easpw@mail.gmail.com>
 <9e16fed9-4399-5c78-cbfb-6be75c295f31@amd.com>
 <CAKv+Gu_0LUY67DwSLU1tyijuF+0mKPpvq1j3RSMy5HBxYE-3qw@mail.gmail.com>
 <96417897-8bf0-e60c-6285-7286673ecd01@amd.com>
 <CAKv+Gu-5=5bKBdO_r=Z3bAqCM36vfH=vLcCcaFtKcwYpe=AP7g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAKv+Gu-5=5bKBdO_r=Z3bAqCM36vfH=vLcCcaFtKcwYpe=AP7g@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, the arch/x86 maintainers <x86@kernel.org>, linux-efi <linux-efi@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>
List-Id: platform-driver-x86.vger.kernel.org

On 2/25/20 12:12 PM, Ard Biesheuvel wrote:
> On Tue, 25 Feb 2020 at 19:10, Tom Lendacky <thomas.lendacky@amd.com> wrote:
>>
>> On 2/25/20 11:58 AM, Ard Biesheuvel wrote:
>>> On Tue, 25 Feb 2020 at 18:54, Tom Lendacky <thomas.lendacky@amd.com> wrote:
>>>>
>>>> On 2/25/20 11:45 AM, Ard Biesheuvel wrote:
>>>>> On Tue, 25 Feb 2020 at 18:41, Tom Lendacky <thomas.lendacky@amd.com> wrote:
>>>>>>
>>>>>> When booting with SME active, EFI tables must be mapped unencrypted since
>>>>>> they were built by UEFI in unencrypted memory. Update the list of tables
>>>>>> to be checked during early_memremap() processing to account for new EFI
>>>>>> tables.
>>>>>>
>>>>>> This fixes a bug where an EFI TPM log table has been created by UEFI, but
>>>>>> it lives in memory that has been marked as usable rather than reserved.
>>>>>>
>>>>>> Signed-off-by: Tom Lendacky <thomas.lendacky@amd.com>
>>>>>>
>>>>>> ---
>>>>>> Changes since v1:
>>>>>> - Re-spun against EFI tree
>>>>>
>>>>> Which one? Surely not the one in the link I included?
>>>>
>>>> I did a git clone of
>>>>
>>>>   git://git.kernel.org/pub/scm/linux/kernel/git/efi/efi.git
>>>>
>>>> and checked out branch next. Not sure what I missed...
>>>>
>>>
>>> Weird. Do you see commit 5d288dbd88606d8f215c7138b10649115d79cadd on
>>> that branch? It removes rng_seed from struct efi, hence my request to
>>> rebase your patch.
>>
>> I had just assumed you wanted a cleaner version and didn't realize that
>> rng_seed was removed from struct efi. My bad for not building.
>>
>>>
>>> IMO, best is to simply drop the 'static' from rng_seed, rename it to
>>> efi_rng_seed, and drop an extern declaration in linux/efi.h so it is
>>> accessible from your code. I'm reluctant to put it back in struct efi.
>>
>> Ok, I'll re-work the patch.
>>
> 
> OK
> 
> Btw if you want the TPM part of the fix to go to -stable, better to
> split them in two (and I'll put a cc:stable on the tpm one)

I had thought about stable, but the fix gets tricky since the two tables
were added at different times (4.16 and 5.3) and the efi_tables array was
moved from drivers/firmware/efi/efi.c to arch/x86/platform/efi/efi.c in 5.4.

I could do the two TPM tables each as their own patch and add an
appropriate Cc: stable # v4.16.x-, etc., if you don't think that's
overkill. The array move shouldn't be too hard to adjust for in stable.
Thoughts?

Thanks,
Tom

> 
