From: Darren Hart <dvhart@infradead.org>
Subject: Re: [3.17 REGRESSION FIX] Revert "ideapad-laptop: Disable touchpad
 interface on Yoga models"
Date: Mon, 25 Aug 2014 20:38:38 -0500
Message-ID: <D0214EE1.A54F3%dvhart@linux.intel.com>
References: <1408960813-12237-1-git-send-email-hdegoede@redhat.com>
 <CA+5PVA7pEwu4amAn+gH3TS-a6CvsSH=TyE+3k07Uoz9BpcpRMA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga14.intel.com ([192.55.52.115]:57567 "EHLO mga14.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755631AbaHZDin (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 25 Aug 2014 23:38:43 -0400
In-Reply-To: <CA+5PVA7pEwu4amAn+gH3TS-a6CvsSH=TyE+3k07Uoz9BpcpRMA@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Josh Boyer <jwboyer@fedoraproject.org>, Hans de Goede <hdegoede@redhat.com>
Cc: Matthew Garrett <matthew.garrett@nebula.com>, Corentin Chary <corentin.chary@gmail.com>, GOESSEL Guillaume <g_goessel@outlook.com>, platform-driver-x86@vger.kernel.org, "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>

On Mon, Aug 25, 2014 at 6:44 AM, Josh Boyer <jwboyer@fedoraproject.org>
wrote:
> On Mon, Aug 25, 2014 at 6:00 AM, Hans de Goede <hdegoede@redhat.com>
>wrote:
>> I've received a bug report from a user that the touchpad control part
>> of the ideapad-laptop ACPI interface does work for him on his
>> "Lenovo Yoga 2 13", and that this patch causes a regression for him.
>>
>> Since it did not work for me when I had a "Lenovo Yoga 2 11" in my own
>> hands (loaned from a friend). It seems that this is a bit of hit and
>>miss.
>>
>> Since the result of having a false positive here is worse, then the
>>minor
>> annoyance of a false touchpad disabled messages being shown after
>>suspend /
>> resume on models (or is it firmware versions?) where the interface does
>>not
>> work, simply revert the patch.
>>
>> This reverts commit f79a901331a823ae370584b15cd39dd110b95a0a.

Appears to be the right call to me. Please give me a couple of days to get
trees mirrored and up to speed. I'll provide links to new trees and such
shortly.

>>
>> Reported-by: GOESSEL Guillaume <g_goessel@outlook.com>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>
> Adding Daren on CC.  He recently agreed to take over the platform
>drivers.
>

Thanks. I'm still sorting out my email situation for this role (apologies
for the last response to those getting this twice). I'll make that clear
in the maintainers patch to follow soon.

Thanks,


-- 
Darren Hart
Intel Open Source Technology Center
