From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v4 04/14] platform/x86: dell-wmi: increase severity of
 some failures
Date: Thu, 5 Oct 2017 08:20:51 +0300
Message-ID: <CAHp75Vd2h5K-Zi4VP=Qesx9=kEEsD-pJGWzBE_LmVVuqPt=h9w@mail.gmail.com>
References: <cover.1507156392.git.mario.limonciello@dell.com> <f9dd40ebcda3238fa431a8a0d38595b808fae38b.1507156392.git.mario.limonciello@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <f9dd40ebcda3238fa431a8a0d38595b808fae38b.1507156392.git.mario.limonciello@dell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mario Limonciello <mario.limonciello@dell.com>
Cc: "dvhart@infradead.org" <dvhart@infradead.org>, LKML <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Andy Lutomirski <luto@kernel.org>, quasisec@google.com, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, mjg59@google.com, Christoph Hellwig <hch@lst.de>, Greg KH <greg@kroah.com>
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Oct 5, 2017 at 1:48 AM, Mario Limonciello
<mario.limonciello@dell.com> wrote:
> There is a lot of error checking in place for the format of the WMI
> descriptor buffer, but some of the potentially raised issues should
> be considered critical failures.
>
> If the buffer size or header don't match, this is a good indication
> that the buffer format changed in a way that the rest of the data
> should not be relied upon.
>
> For the remaining data set vectors, continue to notate a warning
> in undefined results, but as those are fields that the descriptor
> intended to refer to other applications, don't fail if they're new
> values.

> -       if (strncmp(obj->string.pointer, "DELL WMI", 8) != 0)
> -               dev_warn(&wdev->dev, "Dell descriptor buffer has invalid signature (%8ph)\n",
> +       if (strncmp(obj->string.pointer, "DELL WMI", 8) != 0) {
> +               dev_err(&wdev->dev, "Dell descriptor buffer has invalid signature (%8ph)\n",

A nit: ping-pong programming detected.
Looks like current patch 2 should go at least after this one.


-- 
With Best Regards,
Andy Shevchenko
