From: Alberto Mardegan <mardy@users.sourceforge.net>
Subject: Re: Accelerometer and orientation sensor on Lenovo Ideapad S10-3t
Date: Wed, 08 Jun 2011 13:49:09 +0300
Message-ID: <4DEF53A5.2040903@users.sourceforge.net>
References: <4DDE9B92.3090504@users.sourceforge.net>	<20110527163346.GD16769@srcf.ucam.org> <20110608105218.29a7e776@destiny.ordissimo>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ww0-f42.google.com ([74.125.82.42]:62834 "EHLO
	mail-ww0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754238Ab1FHKtN (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 8 Jun 2011 06:49:13 -0400
Received: by wwk4 with SMTP id 4so3332934wwk.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 08 Jun 2011 03:49:12 -0700 (PDT)
In-Reply-To: <20110608105218.29a7e776@destiny.ordissimo>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Anisse Astier <anisse@astier.eu>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org, "Javier S. Pedro" <maemo@javispedro.com>, Ike Panhc <ike.pan@canonical.com>

On 06/08/2011 11:52 AM, Anisse Astier wrote:
> We already had this discussion here:
> http://www.spinics.net/lists/platform-driver-x86/msg01850.html
> and the conclusion was that if you need to poll the device to get the
> fined grain data, and you have a separate event(was ACPI hotkey, not
> WMI) for coarse orientation changes, you should send a KOBJ_CHANGE uevent
> for that.

Thanks Anisse for pointing that thread out.

Ciao,
   Alberto

-- 
http://blog.mardy.it <-- geek in un lingua international!
