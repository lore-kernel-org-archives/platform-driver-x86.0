From: Marco Martin <notmart@gmail.com>
Subject: Re: [PATCH] Support intel-vbtn based tablet mode switch
Date: Tue, 23 Jan 2018 13:42:45 +0100
Message-ID: <CAD6_Bostr0-k4SPO8vnz51hP41-dM0hzDyE7ewdwbq6LLJD38A@mail.gmail.com>
References: <1516625281-16547-1-git-send-email-notmart@gmail.com> <20180122234608.rstey3i2pwoqhntz@dtor-ws>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180122234608.rstey3i2pwoqhntz@dtor-ws>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Matthew Garrett <mjg59@srcf.ucam.org>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Bhushan Shah <bhush94@gmail.com>, Platform Driver <platform-driver-x86@vger.kernel.org>, Mario Limonciello <mario.limonciello@dell.com>, Mario Limonciello <mario_limonciello@dell.com>
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Jan 23, 2018 at 12:46 AM, Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>> @@ -81,6 +86,7 @@ static void notify_handler(acpi_handle handle, u32 event, void *context)
>>                       return;
>>               }
>>       } else if (sparse_keymap_report_event(priv->input_dev, event, 1, true)) {
>> +             input_sync(priv->input_dev);
>
> I do not understand why this is needed, as sparse keymap should issue
> sync for you. From sparse_keymap_report_entry():

indeed, I was testing on a 4.13 build, the sync there was pushed in
november only for 4.14, i've rebuilt it now on 4.14 and my sync is not
needed anymore

> Can be shorter:
>
>                         input_report_switch(priv->input_dev, SW_TABLET_MODE,
>                                         obj->integer.value & TABLET_MODE_FLAG);
>
> You also need:
>
>                         input_sync(priv->input_dev);

in v3 this shorter version and doesn't report the capability if it's
the wrong type

--
Marco Martin
