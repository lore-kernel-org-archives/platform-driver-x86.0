From: Maarten Maathuis <madman2003@gmail.com>
Subject: Re: [PATCH] platform/x86/intel-vbtn: add volume up and down
Date: Mon, 24 Apr 2017 23:32:03 +0200
Message-ID: <CAGZ4FEQ4Dc2f0LpiQf66CZsNWQrAUhuML0Z0dbtaxNgpiUhqKQ@mail.gmail.com>
References: <20170424204727.8872-1-madman2003@shikahr.net> <CAHp75VcrdF13VAAJFTPasOqUBFkVmTYLRUF9ZbnnRem52FTWtA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pg0-f66.google.com ([74.125.83.66]:36816 "EHLO
        mail-pg0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S975266AbdDXVcF (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 24 Apr 2017 17:32:05 -0400
In-Reply-To: <CAHp75VcrdF13VAAJFTPasOqUBFkVmTYLRUF9ZbnnRem52FTWtA@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: AceLan Kao <acelan.kao@canonical.com>, "dvhart@infradead.org" <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Maarten Maathuis <madman2003@shikahr.net>

On Mon, Apr 24, 2017 at 10:55 PM, Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Mon, Apr 24, 2017 at 11:47 PM, Maarten Maathuis <madman2003@gmail.com> wrote:
>> Tested on HP Elite X2 1012 G1.
>> Matches event report of Lenovo Helix 2
>> (https://www.spinics.net/lists/ibm-acpi-devel/msg03982.html).
>
> Thanks for the patch.
>
> A bit of work still required.
>
> According to Submitting Patches document [1] we need your Signed-off-by tag.
>
> Besides that see my comment below.
>
> [1] https://www.kernel.org/doc/Documentation/process/submitting-patches.rst
>
>
>> ---
>>  drivers/platform/x86/intel-vbtn.c | 8 ++++++--
>>  1 file changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/platform/x86/intel-vbtn.c b/drivers/platform/x86/intel-vbtn.c
>> index 554e82ebe83c..1fbebbad350d 100644
>> --- a/drivers/platform/x86/intel-vbtn.c
>> +++ b/drivers/platform/x86/intel-vbtn.c
>> @@ -35,8 +35,12 @@ static const struct acpi_device_id intel_vbtn_ids[] = {
>>
>>  /* In theory, these are HID usages. */
>>  static const struct key_entry intel_vbtn_keymap[] = {
>
>> -       { KE_IGNORE, 0xC0, { KEY_POWER } },     /* power key press */
>> -       { KE_KEY, 0xC1, { KEY_POWER } },        /* power key release */
>> +       { KE_IGNORE, 0xC0, { KEY_POWER } },      /* power key press */
>> +       { KE_KEY, 0xC1, { KEY_POWER } },         /* power key release */
>
> As far as I can see nothing should happen on these lines. I think your
> editor (or maybe email setup) is configured somehow wrongly. We expect
> TAB as an indentation starter.
>
> We also encourage to use git send-email tool instead of manual
> submitting patches through some (broken) MUAs.

I fell back to an other SMTP server, until i can find a structural
long term solution.
The difference in the other two lines was due to a misunderstanding
about indenting
policy. hopefully it's better now.

>
>> +       { KE_KEY, 0xC4, { KEY_VOLUMEUP} },       /* volume-up key press */
>> +       { KE_IGNORE, 0xC5, { KEY_VOLUMEUP } },   /* volume-up key release */
>> +       { KE_KEY, 0xC6, { KEY_VOLUMEDOWN} },     /* volume-down key press */
>> +       { KE_IGNORE, 0xC7, { KEY_VOLUMEDOWN } }, /* volume-down key release */
>>         { KE_END },
>
> --
> With Best Regards,
> Andy Shevchenko



-- 
Far away from the primal instinct, the song seems to fade away, the
river get wider between your thoughts and the things we do and say.
