From: Azael Avalos <coproscefalo@gmail.com>
Subject: Re: [PATCH v2 3/5] toshiba_acpi: Cleanup blank lines after comment blocks
Date: Tue, 5 May 2015 09:25:13 -0600
Message-ID: <CAGdLNWE-+FJEt==Jj7WPX_J6qo6xOUb_gnpwpu3meTMu0E1EjA@mail.gmail.com>
References: <1430759758-4026-1-git-send-email-coproscefalo@gmail.com>
	<1430759758-4026-4-git-send-email-coproscefalo@gmail.com>
	<1430835520.7191.14.camel@perches.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1430835520.7191.14.camel@perches.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Joe Perches <joe@perches.com>
Cc: Darren Hart <dvhart@infradead.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

Hi there,

2015-05-05 8:18 GMT-06:00 Joe Perches <joe@perches.com>:
> On Mon, 2015-05-04 at 11:15 -0600, Azael Avalos wrote:
>> This patch removes some blank lines after comment blocks, capitalizes
>> some comments first words and adds a few comments to the beggining
>> of some functions.
>
> I think blank lines after comments are generally OK.
>
> This is now inconsistent about
>
> /*
>  * short comment
>  */

I was using this kind of comment block to identify function blocks
that belonged to a certain feature set (eg: ACPI functions, sysfs, etc.)
and provide a bit more readability to someone unfamiliar with the code.

>
> and
>
> /* short comment */

And I was using this kind for helper functions or feature function calls.

>
> Not all function blocks need introductory comments.

I know that, but again, I was just adding this for a bit of readability and
consistency, as I've been adding this kind of comment blocks to the
beginning of each feature function call I've been added so far.

So either I remove them all (and be consistent with how the previous
functions were, basically no comments), or keep adding them (and keep
consistency of what I added), I think this is just a matter of taste.

>
>> diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
> []
>> @@ -78,10 +78,9 @@ MODULE_LICENSE("GPL");
>>   * SCI stands for "System Configuration Interface" which aim is to
>>   * conceal differences in hardware between different models.
>>   */
>> -
>>  #define TCI_WORDS                    6
>
> It's sometimes nice to have blank lines after long
> block comments.

OK, I can keep them as is, I have no problem either with these :-)

>
>> -/* operations */
>> +/* Operations */
>
> I think these sentence case changes aren't better.

This was just to follow up on a capitalization already done
to the rest of the comment blocks, but somehow these were
left behind, 'tho not sure if it was on purpose or simply missed.


Cheers
Azael


-- 
-- El mundo apesta y vosotros apestais tambien --
