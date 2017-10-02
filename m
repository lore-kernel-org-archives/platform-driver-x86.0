From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v3 8/8] platform/x86: dell-wmi-smbios: clean up wmi
 descriptor check
Date: Mon, 2 Oct 2017 16:15:53 +0300
Message-ID: <CAHp75VdnzankU9CDu=_OvZVc15WivR2XCFAGuZUB3vJZV3t2=Q@mail.gmail.com>
References: <cover.1506571187.git.mario.limonciello@dell.com> <84b6170a1d3a692b53a40f795dd4f9a3052b8fe3.1506571188.git.mario.limonciello@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <84b6170a1d3a692b53a40f795dd4f9a3052b8fe3.1506571188.git.mario.limonciello@dell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mario Limonciello <mario.limonciello@dell.com>
Cc: "dvhart@infradead.org" <dvhart@infradead.org>, LKML <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Andy Lutomirski <luto@kernel.org>, quasisec@google.com, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Sep 28, 2017 at 7:02 AM, Mario Limonciello
<mario.limonciello@dell.com> wrote:
> Some cases the wrong type was used for errors and checks can be
> done more cleanly.

Oops, I forgot about this patch, so, please, disregard my comment WRT
to strncmp() use to the other patch.


> Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
> Reviewed-by: Edward O'Callaghan <quasisec@google.com>

Btw, missed Suggested-by?


> -       if (desc_buffer[0] != 0x4C4C4544 && desc_buffer[1] != 0x494D5720)
> -               dev_warn(&wdev->dev, "Dell descriptor buffer has invalid signature (%*ph)\n",
> -                       8, desc_buffer);
> +       if (strncmp(obj->string.pointer, "DELL WMI", 8) != 0)
> +               dev_warn(&wdev->dev, "Dell descriptor buffer has invalid signature (%8ph)\n",
> +                       desc_buffer);

And as Darren pointed out, this fixes the logic bug as well.

-- 
With Best Regards,
Andy Shevchenko
