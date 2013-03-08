From: AceLan Kao <acelan.kao@canonical.com>
Subject: Re: [PATCH] dell: add new dell WMI format for the AIO machines
Date: Fri, 8 Mar 2013 16:19:16 +0800
Message-ID: <CAMz9Wg9+PNk2JEtUaR9rs3Oo6eezGjyUDmxLpzgBpzV3szd6ZA@mail.gmail.com>
References: <1362728670-3136-1-git-send-email-acelan.kao@canonical.com>
	<20130308075009.GA18734@srcf.ucam.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-vb0-f53.google.com ([209.85.212.53]:65321 "EHLO
	mail-vb0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755164Ab3CHITR (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 8 Mar 2013 03:19:17 -0500
Received: by mail-vb0-f53.google.com with SMTP id fj18so529084vbb.26
        for <platform-driver-x86@vger.kernel.org>; Fri, 08 Mar 2013 00:19:16 -0800 (PST)
In-Reply-To: <20130308075009.GA18734@srcf.ucam.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org, Colin Ian King <colin.king@canonical.com>

2013/3/8 Matthew Garrett <mjg59@srcf.ucam.org>:
> On Fri, Mar 08, 2013 at 03:44:30PM +0800, AceLan Kao wrote:
>>  static const struct key_entry dell_wmi_aio_keymap[] = {
>>       { KE_KEY, 0xc0, { KEY_VOLUMEUP } },
>>       { KE_KEY, 0xc1, { KEY_VOLUMEDOWN } },
>> +     { KE_KEY, 0xe030, { KEY_VOLUMEUP } },
>> +     { KE_KEY, 0xe02e, { KEY_VOLUMEDOWN } },
>> +     { KE_KEY, 0xe020, { KEY_MUTE } },
>> +     { KE_KEY, 0xe027, { KEY_DISPLAYTOGGLE } },
>> +     { KE_KEY, 0xe006, { KEY_BRIGHTNESSUP } },
>> +     { KE_KEY, 0xe005, { KEY_BRIGHTNESSDOWN } },
>> +     { KE_KEY, 0xe00b, { KEY_SWITCHVIDEOMODE } },
>
> This is starting to look awfully like the keymap in dell-wmi.c. There's
> probably an argument for merging them at the source level, even if it
> ends up duplicated in both drivers.
For All-In-One machines, there will be only some function keys on the
side of the machine,
so the list won't grow like the dell-wmi driver and probably stop
growing quickly.

>> +                     if (dell_wmi_aio_event_check(obj->buffer.pointer,
>> +                                             obj->buffer.length)) {
>
> Are we guaranteed that the old events will never look like this?
There is no easy way to distinguish between the old and the new WMI event,
so what we can do is to add more constraints on it.
With buffer length and the event type checking,
I think it's sufficient for identifying them.


-- 
Chia-Lin Kao(AceLan)
http://blog.acelan.idv.tw/
E-Mail: acelan.kaoATcanonical.com (s/AT/@/)
