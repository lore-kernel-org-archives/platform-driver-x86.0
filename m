From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 3/3] platform/x86: dell-smbios: Link all dell-smbios-*
 modules together
Date: Tue, 27 Feb 2018 18:16:46 +0200
Message-ID: <CAHp75VchPrF8ndHck9pzjOOScTS627x9TFLsnr+LWxiwTgck9w@mail.gmail.com>
References: <1519747014-17561-1-git-send-email-mario.limonciello@dell.com>
 <1519747014-17561-3-git-send-email-mario.limonciello@dell.com>
 <CAHp75VcNWo0Mh8jYU0vV+RRt3ZudKns_ZStcp_7ueebJfwL_nQ@mail.gmail.com> <92c22f39a7df439a9e18cb975eec086e@ausx13mpc124.AMER.DELL.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <92c22f39a7df439a9e18cb975eec086e@ausx13mpc124.AMER.DELL.COM>
Sender: linux-kernel-owner@vger.kernel.org
To: Mario Limonciello <Mario.Limonciello@dell.com>
Cc: Darren Hart <dvhart@infradead.org>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Feb 27, 2018 at 6:13 PM,  <Mario.Limonciello@dell.com> wrote:

>> > --- a/drivers/platform/x86/dell-smbios.h
>> > +++ b/drivers/platform/x86/dell-smbios.h
>> > @@ -75,4 +75,10 @@ int dell_laptop_register_notifier(struct notifier_block
>> *nb);
>> >  int dell_laptop_unregister_notifier(struct notifier_block *nb);
>> >  void dell_laptop_call_notifier(unsigned long action, void *data);
>> >
>> > +/* for the supported backends */
>> > +int init_dell_smbios_wmi(void);
>> > +void exit_dell_smbios_wmi(void);
>> > +int init_dell_smbios_smm(void);
>> > +void exit_dell_smbios_smm(void);
>> > +
>>
>> ...here...
>
> So do you mean you would rather see inline functions in header
> file for the #else case then?

At least is sounds as a standard practice to me.

-- 
With Best Regards,
Andy Shevchenko
