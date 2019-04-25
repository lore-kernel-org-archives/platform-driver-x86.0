From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH v2 2/2] xen/pvh: correctly setup the PV EFI interface for
 dom0
Date: Thu, 25 Apr 2019 10:27:22 -0400
Message-ID: <c2993226-ca65-8bb2-dc23-f2a83f3d76db@oracle.com>
References: <20190423130416.68935-1-roger.pau@citrix.com>
 <20190423130416.68935-2-roger.pau@citrix.com>
 <2359c97c-1125-cfd2-44c2-7e9ce7972558@oracle.com>
 <20190424154504.vzkkobxsesc3oval@Air-de-Roger>
 <131ff20e-5f28-40ef-37a0-422f6508c115@oracle.com>
 <20190425100259.f2k7ayzlxctucitg@Air-de-Roger>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190425100259.f2k7ayzlxctucitg@Air-de-Roger>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: linux-kernel@vger.kernel.org, Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, xen-devel@lists.xenproject.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On 4/25/19 6:02 AM, Roger Pau Monné wrote:
> On Wed, Apr 24, 2019 at 11:45:43AM -0400, Boris Ostrovsky wrote:
>> On 4/24/19 11:45 AM, Roger Pau Monné wrote:
>>> On Wed, Apr 24, 2019 at 11:36:41AM -0400, Boris Ostrovsky wrote:
>>>> On 4/23/19 9:04 AM, Roger Pau Monne wrote:
>>>>> This involves initializing the boot params EFI related fields and the
>>>>> efi global variable.
>>>>>
>>>>> Without this fix a PVH dom0 doesn't detect when booted from EFI, and
>>>>> thus doesn't support accessing any of the EFI related data.
>>>>>
>>>>> Reported-by: PGNet Dev <pgnet.dev@gmail.com>
>>>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>>> Hmm.. This seems to be breaking save/restore for me (for domU), and I
>>>> can't see any obvious reasons.
>>>>
>>>> Can you try it?
>>> Sure, thanks for the extra testing! I have to admit I haven't tested
>>> save/restore with this patch applied, it didn't come to mind it might
>>> affect that functionality.
>>>
>>> I assume it's save/restore of a PVH domU that's broken (HVM and PV are
>>> fine)?
>>>
>>
>> PV is fine, I haven't tried HVM.
> I've tested live migration and save/restore of this series on top of
> 5.1.0-rc5 and seems to work fine for me. On top of which Linux version
> where you testing, and can you paste the guest config file?
>

It's not your change.

I was booting with threadirqs boot option and hvc console apparently
doesn't like that. It's not 100% reproducible, but I was able to fail
save/restore without your patches as well.

I may look at this sometime next week, but in the meantime for both patches

Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>

and I will add 4.19+ for stable.

-boris
