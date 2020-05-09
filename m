From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH] platform/x86: asus-nb-wmi: Do not load on Asus T100TA and
 T200TA
Date: Sat, 9 May 2020 14:53:30 +0200
Message-ID: <5a6d2656-ee4c-c3a8-03d3-197106b063f1@redhat.com>
References: <20200422220559.99726-1-hdegoede@redhat.com>
 <bcb4d40a-8971-22d6-959b-14b2d329cfd4@redhat.com>
 <CAHp75Vceqb4tpM_G7hcg2RWF6Cp+P61NiiYfQsf9tr8vtFJGHg@mail.gmail.com>
 <CAHp75VdTuwyJuGsAR4NwJm302Va+68dDdtC-kn3581asg-onvQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75VdTuwyJuGsAR4NwJm302Va+68dDdtC-kn3581asg-onvQ@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Corentin Chary <corentin.chary@gmail.com>, acpi4asus-user <acpi4asus-user@lists.sourceforge.net>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

Hi,

On 5/9/20 2:23 PM, Andy Shevchenko wrote:
> On Fri, May 8, 2020 at 11:56 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
>>
>> On Fri, May 8, 2020 at 10:54 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>> On 4/23/20 12:05 AM, Hans de Goede wrote:
>>
>>> Andy, Darren, I see that you have already added this to the for-next
>>> branch of linux-platform-drivers-x86. I'm not sure what your vision
>>> on forced pushed there is. If forced pushes are ok, please drop this
>>> patch. If not let me know and I will send out a revert.
>>
>> Forced pushes are not okay, but we have exceptions in some cases.
>> It would be done here, but there are complications, i.e. we have
>> already immutable branch merged from MFD. Of course, I would remerge
>> it again, but I think we better not to do this right now, so, revert
>> seems a less painful in this case. Or, if you have already done
>> something better, than keep it as follow up improvement rather than
>> pure revert.

Ok, doing the revert is fine with me, I've prepped it and I will
send it out right away.

> Oops, it seems I was quick enough to push this to v5.7-rc4. So, please
> send revert!

Note the commit does not break anything; it even works as advertised
to fix the camera LED being stuck in on state at boot on the Asus T100TA
and Asus T200TA.

The problem is that I'm working on making various 2-in-1s report their
tablet-mode state (SW_TABLET_MODE) to userspace; and I've found that
these 2 Asus models (and other Asus models) report this through WMI.

So the blacklisting of these 2 models inside asus-nb-wmi needs to be
dropped to make the SW_TABLET_MODE reporting work once I have added that
to the asus-nb-wmi driver, so the revert is to prepare for that it
does not fix any regression, since the current version of asus-nb-wmi
does not handle SW_TABLET_MODE.

So there is no need to rush the revert upstream, it can go to 5.8 together
with the asus-nb-wmi changes to add SW_TABLET_MODE support.

The reason I was asking to drop the commit was because I came to the
conclusion that in the end the blacklist is not what we want. But for
now having the blacklist is fine.

Regards,

Hans
