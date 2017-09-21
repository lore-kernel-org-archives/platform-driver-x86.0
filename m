From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 07/12] platform/x86: dell-wmi-smbios: Use Dell WMI
 descriptor check
Date: Thu, 21 Sep 2017 19:44:28 +0300
Message-ID: <CAHp75Vds+meGPSusqu5Hb1z7VtVRf55o7665Jzn0ky7CB5dnXQ@mail.gmail.com>
References: <cover.1505999739.git.mario.limonciello@dell.com> <1001812b63d73bf3ccd5ea6c76604cae0fa1525a.1505999739.git.mario.limonciello@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1001812b63d73bf3ccd5ea6c76604cae0fa1525a.1505999739.git.mario.limonciello@dell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mario Limonciello <mario.limonciello@dell.com>
Cc: "dvhart@infradead.org" <dvhart@infradead.org>, LKML <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, quasisec@google.com, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Sep 21, 2017 at 4:57 PM, Mario Limonciello
<mario.limonciello@dell.com> wrote:
> The Dell WMI descriptor check is used as an indication that WMI
> calls are safe to run both when used with the notification
> ASL/GUID pair as well as the SMBIOS calling ASL/GUID pair.
>
> As some code in dell-wmi-smbios is already a prerequisite for
> dell-wmi, move the code for performing the descriptor check into
> dell-wmi-smbios and let both drivers use it from there.

> +       desc_buffer = (u32 *)obj->buffer.pointer;
> +

> +       if (desc_buffer[0] != 0x4C4C4544 && desc_buffer[1] != 0x494D5720)

I was thinking about strncmp() here for a full line, though decide not
to push it anyhow. Those IDs is binary data, can be anything and you
have comment of what is expected here.

But I think it would be nice to create a separate definitions and make
comments there.

> +               dev_warn(&wdev->dev, "Dell descriptor buffer has invalid signature (%*ph)\n",
> +                       8, desc_buffer);

%8ph ?

> +
> +       if (desc_buffer[2] != 0 && desc_buffer[2] != 1)
> +               dev_warn(&wdev->dev, "Dell descriptor buffer has unknown version (%d)\n",
> +                       desc_buffer[2]);

%u ? u32 can't be negative and you basically allow it.

> +
> +       if (desc_buffer[3] != 4096)
> +               dev_warn(&wdev->dev, "Dell descriptor buffer has invalid buffer length (%d)\n",
> +                       desc_buffer[3]);

Ditto.


P.S. I noticed this all in old code, so, you can address my comments
in a separate patch if you find them useful.

-- 
With Best Regards,
Andy Shevchenko
