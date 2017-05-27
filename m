From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: wmi: Fix printing info about WDG structure
Date: Sat, 27 May 2017 16:07:09 +0300
Message-ID: <CAHp75Vez0ZbBQ_uK1=Q7C3azwBQWerZiio0c2p4WEutXK1NhPg@mail.gmail.com>
References: <1495885877-7906-1-git-send-email-pali.rohar@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qt0-f171.google.com ([209.85.216.171]:34531 "EHLO
        mail-qt0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752154AbdE0NHK (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 27 May 2017 09:07:10 -0400
In-Reply-To: <1495885877-7906-1-git-send-email-pali.rohar@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Andy Lutomirski <luto@kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Sat, May 27, 2017 at 2:51 PM, Pali Roh=C3=A1r <pali.rohar@gmail.com> wro=
te:
> object_id and notify_id are in one union structure and their meaning is
> defined by flags. Therefore do not print notify_id for non-event block an=
d
> do not print object_id for event block. Remove also reserved member as it
> does not have any defined meaning or type yet.
>
> As object_id and notify_id union members overlaps and have different type=
s,
> it caused that kernel print to dmesg binary data. This patch eliminates i=
t.

> -       pr_info("\tobject_id: %c%c\n", g->object_id[0], g->object_id[1]);
> -       pr_info("\tnotify_id: %02X\n", g->notify_id);

> -       pr_info("\treserved: %02X\n", g->reserved);

Do we need this? Commit message doesn't clarify.

> +       if (g->flags & ACPI_WMI_EVENT)
> +               pr_info("\tnotify_id: 0x%02X\n", g->notify_id);
> +       else

> +               pr_info("\tobject_id: %c%c\n", g->object_id[0], g->object=
_id[1]);

If this can still contain non-printable characters the %*pE can help instea=
d.

--=20
With Best Regards,
Andy Shevchenko
