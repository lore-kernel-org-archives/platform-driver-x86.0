From: Marco Martin <notmart@gmail.com>
Subject: Re: [PATCH] Support intel-vbtn based tablet mode switch
Date: Mon, 22 Jan 2018 14:52:47 +0100
Message-ID: <CAD6_BovWVrbTqBcNE9a=kH9Kk3EzKj7yvz0_Yx0Qat7fzhJTCg@mail.gmail.com>
References: <1516625281-16547-1-git-send-email-notmart@gmail.com> <CAHp75VeaoFhJ=nF2dfQZnfFjNTWy4_9rr6K4JpUYRVZnKDLkSQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75VeaoFhJ=nF2dfQZnfFjNTWy4_9rr6K4JpUYRVZnKDLkSQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Matthew Garrett <mjg59@srcf.ucam.org>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Bhushan Shah <bhush94@gmail.com>, Platform Driver <platform-driver-x86@vger.kernel.org>, Mario Limonciello <mario.limonciello@dell.com>, Mario Limonciello <mario_limonciello@dell.com>
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Jan 22, 2018 at 2:42 PM, Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
>> +       status = acpi_evaluate_object(handle, "VGBS", NULL, &vgbs_output);
>> +       /* VGBS being present and returning something means
>> +        * we have a tablet mode switch
>> +        */
>> +       if (ACPI_SUCCESS(status)) {
>> +               union acpi_object *obj = vgbs_output.pointer;
>> +
>> +               input_set_capability(priv->input_dev, EV_SW, SW_TABLET_MODE);
>> +
>> +               if (obj && obj->type == ACPI_TYPE_INTEGER) {
>> +                       if (obj->integer.value & TABLET_MODE_FLAG)
>> +                               input_report_switch(priv->input_dev,
>
>> +                                                       SW_TABLET_MODE,
>> +                                                       0);
>
> One line?

checkpatch.pl was complaining about lines too long.

--
Marco Martin
