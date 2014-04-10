From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v2 0/1] thinkpad_acpi: Add mappings for F9 - F12 hotkeys
 on X240 / T440 / T540
Date: Thu, 10 Apr 2014 10:17:02 +0200
Message-ID: <5346537E.6010201@redhat.com>
References: <1397036806-31106-1-git-send-email-hdegoede@redhat.com> <20140409180300.GB22476@khazad-dum.debian.net> <20140409182758.GA3196@srcf.ucam.org> <20140410001221.GA23977@khazad-dum.debian.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:1390 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S965506AbaDJIRL (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 10 Apr 2014 04:17:11 -0400
In-Reply-To: <20140410001221.GA23977@khazad-dum.debian.net>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Henrique de Moraes Holschuh <hmh@hmh.eng.br>, Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org

Hi,

On 04/10/2014 02:12 AM, Henrique de Moraes Holschuh wrote:
> On Wed, 09 Apr 2014, Matthew Garrett wrote:
>> On Wed, Apr 09, 2014 at 03:03:01PM -0300, Henrique de Moraes Holschuh wrote:
>>> On Wed, 09 Apr 2014, Hans de Goede wrote:
>>>> This patch seems to have fallen through the cracks, so here is a resend.
>>>
>>> Sort of.  There was a doubt about one of the keycodes.
>>
>> I think I'm ok with the keycode.
> 
> Ok.  Now, provided that it doesn't clash with the other thinkpads (in which
> case we'd just add selective keymaps), we can merge.

It does not clash with the new Carbon X1 2nd generation stuff, see:
http://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/commit/drivers/platform/x86/thinkpad_acpi.c?id=8f5f86abc6593b6d600712435e2f24a7a098b951

Basically the new stuff uses hotkey codes >= TPACPI_HOTKEY_MAP_LEN,
where as my patch adds mappings for codes < TPACPI_HOTKEY_MAP_LEN.

(Where TPACPI_HOTKEY_MAP_LEN == 32)

> Heck, we can fix that later too, it doesn't count as an ABI break, these
> keymaps are _already_ configurable from userspace _and_ usually reconfigured
> by userspace, the driver just tries to provide sane defaults.  So...
> 
> Acked-by: Henrique de Moraes Holschuh <hmh@hmh.eng.br>

Thanks & Regards,

Hans
