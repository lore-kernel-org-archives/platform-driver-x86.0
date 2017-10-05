From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: peaq-wmi: Add DMI check before binding to
 the WMI interface
Date: Thu, 5 Oct 2017 20:59:07 +0300
Message-ID: <CAHp75VcPvwusgznA_rx7+1bdqjHSJ-Z8CE36EktpegMBoWWCzg@mail.gmail.com>
References: <20171005142021.4899-1-hdegoede@redhat.com> <CAHp75VezzgBXscqiVg_eFkpQdk8NPjQVyxh2FH_DuXop74KzLw@mail.gmail.com>
 <acc2d503-877b-5862-b978-4aea41eca4b8@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <acc2d503-877b-5862-b978-4aea41eca4b8@redhat.com>
Sender: stable-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, stable@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Oct 5, 2017 at 5:27 PM, Hans de Goede <hdegoede@redhat.com> wrote:
> Hi,
>
> On 05-10-17 16:23, Andy Shevchenko wrote:
>>
>> On Thu, Oct 5, 2017 at 5:20 PM, Hans de Goede <hdegoede@redhat.com> wrote:
>>>
>>> It seems that the WMI GUID used by the PEAQ 2-in-1 WMI hotkeys is not
>>> as unique as a GUID should be and is used on some other devices too.
>>>
>>> This is causing spurious key-press reports on these other devices.
>>>
>>> This commits adds a DMI check to the PEAQ 2-in-1 WMI hotkeys driver to
>>> ensure that it is actually running on a PEAQ 2-in-1, fixing the
>>> spurious key-presses on these other devices.
>>>
>>
>> Recently I have pushed similar patch (another device). Can you rebase
>> against testing?
>
>
> That patch adds a blacklist, for yet another model then the 2 bugreports:
>
>>> BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=1497861
>>> BugLink: https://bugzilla.suse.com/attachment.cgi?id=743182
>
>
> which I've received. My patch adds a whitelist instead as it seems the GUID
> used is some very generic GUID,

Since you are maintainer and moreover have a hardware to test I assume
that's correct thing to do...

> so the blacklist patch should simply be
> dropped,

... however, the patch can't be dropped.

Either me, or you in v2 need to revert it. Tell me what you prefer here.

In any case, please (re)send with Cc to Kai so he or bug reportes may
have a chance to test it as well.

-- 
With Best Regards,
Andy Shevchenko
