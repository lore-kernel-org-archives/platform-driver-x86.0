From: Kai-Heng Feng <kai.heng.feng@canonical.com>
Subject: Re: [PATCH resend] platform/x86: peaq-wmi: Add DMI check before
 binding to the WMI interface
Date: Sat, 7 Oct 2017 23:21:02 +0800
Message-ID: <CAAd53p43Hea0cuA1fGUq8Ta50w5y5Z1S7sUHV7KFCucGNo29gQ@mail.gmail.com>
References: <20171005180404.15044-1-hdegoede@redhat.com> <CAAd53p6rtLR7XvZx4pHNiHx4npBLM0oJ7+7CEjxNHxJu2rWuzA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAAd53p6rtLR7XvZx4pHNiHx4npBLM0oJ7+7CEjxNHxJu2rWuzA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

Hi,

On Fri, Oct 6, 2017 at 12:23 PM, Kai-Heng Feng
<kai.heng.feng@canonical.com> wrote:
> Hi Hans,
>
> On Fri, Oct 6, 2017 at 2:04 AM, Hans de Goede <hdegoede@redhat.com> wrote:
>> Hi All,
>>
>> This is a resend with Kai Heng Feng added to the Cc. Kai can you please
>> test this patch. This patch replaces yours, as many devices seem to be
>> affected so a whitelist is the better approach here.
>
> I'll let the affected user to test the patch.

The user reports the new patch works.

Thanks.

>
> Thanks!
>
>>
>> Regards,
>>
>> Hans
