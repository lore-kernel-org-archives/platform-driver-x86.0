From: Colin Ian King <colin.king@canonical.com>
Subject: Re: [PATCH] dell: add new dell WMI format for the AIO machines
Date: Fri, 08 Mar 2013 10:40:29 +0000
Message-ID: <5139C01D.5080501@canonical.com>
References: <1362728670-3136-1-git-send-email-acelan.kao@canonical.com> <20130308075009.GA18734@srcf.ucam.org> <CAMz9Wg9+PNk2JEtUaR9rs3Oo6eezGjyUDmxLpzgBpzV3szd6ZA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:52068 "EHLO
	youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754985Ab3CHKkc (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 8 Mar 2013 05:40:32 -0500
In-Reply-To: <CAMz9Wg9+PNk2JEtUaR9rs3Oo6eezGjyUDmxLpzgBpzV3szd6ZA@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: AceLan Kao <acelan.kao@canonical.com>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org

On 08/03/13 08:19, AceLan Kao wrote:
> 2013/3/8 Matthew Garrett <mjg59@srcf.ucam.org>:
>> On Fri, Mar 08, 2013 at 03:44:30PM +0800, AceLan Kao wrote:
>>>   static const struct key_entry dell_wmi_aio_keymap[] = {
>>>        { KE_KEY, 0xc0, { KEY_VOLUMEUP } },
>>>        { KE_KEY, 0xc1, { KEY_VOLUMEDOWN } },
>>> +     { KE_KEY, 0xe030, { KEY_VOLUMEUP } },
>>> +     { KE_KEY, 0xe02e, { KEY_VOLUMEDOWN } },
>>> +     { KE_KEY, 0xe020, { KEY_MUTE } },
>>> +     { KE_KEY, 0xe027, { KEY_DISPLAYTOGGLE } },
>>> +     { KE_KEY, 0xe006, { KEY_BRIGHTNESSUP } },
>>> +     { KE_KEY, 0xe005, { KEY_BRIGHTNESSDOWN } },
>>> +     { KE_KEY, 0xe00b, { KEY_SWITCHVIDEOMODE } },
>>
>> This is starting to look awfully like the keymap in dell-wmi.c. There's
>> probably an argument for merging them at the source level, even if it
>> ends up duplicated in both drivers.
> For All-In-One machines, there will be only some function keys on the
> side of the machine,
> so the list won't grow like the dell-wmi driver and probably stop
> growing quickly.
>
>>> +                     if (dell_wmi_aio_event_check(obj->buffer.pointer,
>>> +                                             obj->buffer.length)) {
>>
>> Are we guaranteed that the old events will never look like this?
> There is no easy way to distinguish between the old and the new WMI event,
> so what we can do is to add more constraints on it.
> With buffer length and the event type checking,
> I think it's sufficient for identifying them.
>
..I'm in agreement about this. The original set of machines that passed 
the event info in a buffer were a minimal batch and had the firmware 
written by a totally different BIOS vendor than the original set of AOI 
machines - and they were a limit run.  The checks you've now added are 
most probably sufficient until somebody decides to change the Dell AIO 
implementation again.  So I'm happy with this as it stands.

Colin
