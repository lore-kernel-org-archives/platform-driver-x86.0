From: Azael Avalos <coproscefalo@gmail.com>
Subject: Re: [PATCH] toshiba_acpi: Initialize hotkey_event_type variable
Date: Wed, 4 Nov 2015 09:07:10 -0700
Message-ID: <CAGdLNWGtJhXHMrLQ6EJz4YVKVLpg0ZzoiLazH2nved2bSh7Wqw@mail.gmail.com>
References: <CAGdLNWFzJpCJhmc_h-CCvez7Xnu2S3Ts607pKdb8_tHN29E08A@mail.gmail.com>
	<20151104004439.GB4650@malice.jf.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f47.google.com ([74.125.82.47]:33218 "EHLO
	mail-wm0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753556AbbKDQHM (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 4 Nov 2015 11:07:12 -0500
In-Reply-To: <20151104004439.GB4650@malice.jf.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, stable@vger.kernel.org

Hi Darren,

2015-11-03 17:44 GMT-07:00 Darren Hart <dvhart@infradead.org>:
> On Sun, Nov 01, 2015 at 07:30:30PM -0700, Azael Avalos wrote:
>> Commit 23f8f4326a15 ("toshiba_acpi: Fix hotkeys registration on some
>> toshiba models") fixed an issue on some laptops regarding hotkeys
>> registration, however, if failed to address the initialization of the
>> hotkey_event_type variable, and thus, it can lead to potential
>> unwanted effects as the variable is being checked.
>>
>> This patch initializes such variable to avoid such unwanted effects.
>>
>> Cc: <stable@vger.kernel.org> # 4.1+
>> Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
>> ---
>> Darren,
>>
>> Sorry for sending this patch this late, I had a really busy week :-(
>
> It's a trivial patch, so I'm not concerned with the timing. Thanks for getting
> it out!
>
> Unfortunately, it doesn't apply and appears to be whitespace mangled. Checkpatch
> complains and tabs appear to have been replaced with spaces. Please check your
> send mail mechanism and resend - possibly using git-send-email or something like
> mutt -H PATCHNAME. Try sending to yourself first and verifying you can apply it.

Ughh, sorry about this, I sent this email directly instead of git-send-email,
so the copy-paste might have changed something.

The version of git I'm currently using parses the stable address as
stable@vger.kernel.org#4.1+ and gsmtp complains about a malformed address...

I'll try to resend this patch ASAP.


>
> Thanks,
>

Cheers
Azael



-- 
-- El mundo apesta y vosotros apestais tambien --
