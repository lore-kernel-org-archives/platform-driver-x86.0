From: Mike Travis <mike.travis@hpe.com>
Subject: Re: [PATCH AUTOSEL 5.3 169/203] x86/platform/uv: Fix kmalloc() NULL
 check routine
Date: Wed, 2 Oct 2019 07:35:59 -0700
Message-ID: <c3ecfbb0-b1d2-9af9-97e9-408a45b696d4@hpe.com>
References: <20190922184350.30563-1-sashal@kernel.org>
 <20190922184350.30563-169-sashal@kernel.org>
 <20190922202544.GA2719513@kroah.com> <20191001160601.GX8171@sasha-vm>
 <ea163ee8ba4446978732c2c6607bd6da@AcuMS.aculab.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <ea163ee8ba4446978732c2c6607bd6da@AcuMS.aculab.com>
Content-Language: en-US
Sender: stable-owner@vger.kernel.org
To: David Laight <David.Laight@ACULAB.COM>, 'Sasha Levin' <sashal@kernel.org>, Greg KH <gregkh@linuxfoundation.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "stable@vger.kernel.org" <stable@vger.kernel.org>, Austin Kim <austindh.kim@gmail.com>, Dimitri Sivanich <dimitri.sivanich@hpe.com>, Hedi Berriche <hedi.berriche@hpe.com>, Linus Torvalds <torvalds@linux-foundation.org>, Peter Zijlstra <peterz@infradead.org>, Russ Anderson <russ.anderson@hpe.com>, Steve Wahl <steve.wahl@hpe.com>, Thomas Gleixner <tglx@linutronix.de>, "allison@lohutok.net" <allison@lohutok.net>, "andy@infradead.org" <andy@infradead.org>, "armijn@tjaldur.nl" <armijn@tjaldur.nl>, "bp@alien8.de" <bp@alien8.de>, "dvhart@infradead.org" <dvhart@infradead.org>, "hpa@zytor.com" <hpa@zytor.com>, "kjlu@umn.edu" <kjlu@umn.edu>, "platform-driver-x86@vger.kernel.org" <platform-driver-x>
List-Id: platform-driver-x86.vger.kernel.org



On 10/2/2019 1:34 AM, David Laight wrote:
> From: Sasha Levin
>> Sent: 01 October 2019 17:06
>> Subject: Re: [PATCH AUTOSEL 5.3 169/203] x86/platform/uv: Fix kmalloc() NULL check routine
>>
>> On Sun, Sep 22, 2019 at 10:25:44PM +0200, Greg KH wrote:
>>> On Sun, Sep 22, 2019 at 02:43:15PM -0400, Sasha Levin wrote:
>>>> From: Austin Kim <austindh.kim@gmail.com>
>>>>
>>>> [ Upstream commit 864b23f0169d5bff677e8443a7a90dfd6b090afc ]
>>>>
>>>> The result of kmalloc() should have been checked ahead of below statement:
>>>>
>>>> 	pqp = (struct bau_pq_entry *)vp;
>>>>
>>>> Move BUG_ON(!vp) before above statement.
>>>>
>>>> Signed-off-by: Austin Kim <austindh.kim@gmail.com>
> ...
>>>> ---
>>>>   arch/x86/platform/uv/tlb_uv.c | 4 ++--
>>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/arch/x86/platform/uv/tlb_uv.c b/arch/x86/platform/uv/tlb_uv.c
>>>> index 20c389a91b803..5f0a96bf27a1f 100644
>>>> --- a/arch/x86/platform/uv/tlb_uv.c
>>>> +++ b/arch/x86/platform/uv/tlb_uv.c
>>>> @@ -1804,9 +1804,9 @@ static void pq_init(int node, int pnode)
>>>>
>>>>   	plsize = (DEST_Q_SIZE + 1) * sizeof(struct bau_pq_entry);
>>>>   	vp = kmalloc_node(plsize, GFP_KERNEL, node);
>>>> -	pqp = (struct bau_pq_entry *)vp;
>>>> -	BUG_ON(!pqp);
>>>> +	BUG_ON(!vp);
>>>>
>>>> +	pqp = (struct bau_pq_entry *)vp;
>>>>   	cp = (char *)pqp + 31;
>>>>   	pqp = (struct bau_pq_entry *)(((unsigned long)cp >> 5) << 5);
>>>>
>>>
>>> How did this even get merged in the first place?  I thought a number of
>>> us complained about it.
>>>
>>> This isn't any change in code, and the original is just fine, the author
>>> didn't realize how C works :(
> 
> Mind you, the code itself if pretty horrid.
> Looks like it is aligning to 32 bytes, easier done by:
> 	pqp = (void *)((unsigned long)vp + 31 & ~31);
> (and there's a roundup macro to obfuscate it somewhere.)
> But I'd also expect to see a matching '+ 31' in the size passed to kmalloc().
> Not to mention a comment!
> 
> 	David
> 
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
> Registration No: 1397386 (Wales)
> 

Thanks, I will put all of these comments in my notes.  This whole 
function is slated to move to a specialized UV APIC driver since it uses 
a unique scaling feature available in the UV hardware.  (The original 
author has long retired.)

-Mike
