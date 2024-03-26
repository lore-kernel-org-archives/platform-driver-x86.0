Received: from a2i640.smtp2go.com (a2i640.smtp2go.com [103.47.206.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F38384D3C
	for <platform-driver-x86@vger.kernel.org>; Tue, 26 Mar 2024 16:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.47.206.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711471650; cv=none; b=m+58Uua9aH1rRub8kpXSj6lwqEjlPTbMEBo6bW893OoQqFkcnmkQ3C5tHCVHF+cPpfB4vyPwPqiN/k3wrx/2Hx4s+kysukHEdcHyz5jw76Vq+aoqdZfr6Ldr++3iGW9VeQkHijZ/0Lf08n07duZOoFZ9VZYjPoRtxzdmk5tE9AE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711471650; c=relaxed/simple;
	bh=ZfGIJQbiIdRRE6Nc97PJZ0HyPBWSVqm528bg4VWq63M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=jtm24NqYhmFK4pAYhV98+V+MEgAMidKMkEPUre3YSwZvptEw0JAmvenTsqchxs2JjEhX7LKrc6l+v3yC+aEZpuvIZAp2n7z84hY2ascqqRzO0we+4LacgUHF2z4s/ISYQbGZ4rnEH1MDZeXW0ZozcXoRKdp2/AIU8icWazx7B+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dennisn.mooo.com; spf=pass smtp.mailfrom=return.smtpservice.net; dkim=pass (2048-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b=oBHQQJrT; arc=none smtp.client-ip=103.47.206.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dennisn.mooo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=return.smtpservice.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b="oBHQQJrT"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=smtpservice.net; s=maow60.a1-4.dyn; x=1711472547; h=Feedback-ID:
	X-Smtpcorp-Track:Message-ID:Subject:To:From:Date:Reply-To:Sender:
	List-Unsubscribe; bh=bK/fZVN0b77vJGbgDMfFKQrapH698ESf+TDs3HmlLqg=; b=oBHQQJrT
	MgCkZrpGeo5zrPBUqtPSHFijmI1r0vVVW8WX62gbuj57BqBVanPM4BynANxPUxOVEF0GmqzTeWE0F
	xdfd8I6DQ+gNXl4amkevmghnmJFjh5z/ab4xEsNrBWj30Z3QGZziVErixEYw2dGJRH5YNm8niQOYi
	/flxUdLug/wsVYIOckv7DiqeP17WFAjVdJTl312IBDD6jW5MmJ9MwxWs9Idm8F1HsvhGdTL0KsWH+
	ts2g3hdVohxvR//WPOErVZj1MwPiz5E2xDllqS26EAc6higZLEAZE0hAOSw9pwdOY0FLjeJ3T+jeY
	mk+FNN4GX0ug5DYX/cFxGhT+MA==;
Received: from [10.45.79.114] (helo=SmtpCorp) by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2-S2G) (envelope-from <dennisn@dennisn.mooo.com>)
 id 1rp9xI-piOxNW-Io; Tue, 26 Mar 2024 16:47:20 +0000
Received: from [10.220.238.86] (helo=dennisn.mooo.com)
 by smtpcorp.com with esmtpa (Exim 4.96.1-S2G)
 (envelope-from <dennisn@dennisn.mooo.com>) id 1rp9xG-g2wANu-2f;
 Tue, 26 Mar 2024 16:47:19 +0000
Received: by dennisn.mooo.com (sSMTP sendmail emulation);
 Tue, 26 Mar 2024 12:47:16 -0400
Date: Tue, 26 Mar 2024 12:47:16 -0400
From: Dennis Nezic <dennisn@dennisn.mooo.com>
To: Hans de Goede <hdegoede@redhat.com>, Armin Wolf <W_Armin@gmx.de>
Cc: platform-driver-x86@vger.kernel.org
Subject: Re: hp-wmi: info hotkey has no keycode or scancode
Message-ID: <ZgL8FA8lpc-El3n3@panther>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <66e0100d-dc65-4598-9def-d04a8cdfa067@redhat.com>
X-Smtpcorp-Track: 1rp9xGg2wjNI2f.jAwVUWCQvD6MT
Feedback-ID: 498822m:498822aoToIo_:498822sZEw92SIK9
X-Report-Abuse: Please forward a copy of this message, including all headers,
 to <abuse-report@smtp2go.com>

>>>>>>> Remember all my other fancy hotkeys "work", but they appear as regular
>>>>>>> keypress events from an "AT Translated Set 2 keyboard".

>>>>>>>> If you still cannot receive any netlink events, then i might need
>>>>>>>> to take a look at your ACPI tables
>>>>>>>> via acpidump.
>>>>>>> https://dennisn.mooo.com/stuff/dump.txt

>>>>> I took a look at your ACPI tables and it seems that the WMI device
>>>>> used by hp-wmi is indeed unused.
>>>>> What is the model name of your HP notebook?
>>> HP Compaq 8710p

>>>> Also i just noted that your notebook might contain a PNP0C32 quickstart button device.
>>>> Can you tell me the output of "cat /sys/bus/acpi/devices/PNP0C32\:00/status"?
>>> 15
>> Interesting.

>> There have been several attempts to add support for this
>> in the past. The last one being:
>> https://lore.kernel.org/platform-driver-x86/20220922182424.934340-1-lkml@vorpal.se/
>>
>> Note that in this case this also required some vender
>> specific poking in toshiba_acpi to get things to work.
>>
>> I see that the HP Compaq 8710p is about the same vintage
>> as the Toshiba Z830 on which the last attempt to do
>> something about the quick start buttons was done.
>>
>> So this might very well explain the missing button issue.
>>
>> Regards,
>>
>> Hans

> As discussed below these "quick start" buttons
> normally are only intended to wake up the laptop
> and then immediately on wakeup start a specific app
> tied to the button (IIRC). But at least on the Toshiba
> the toshiba_acpi driver's special "poke" of the firmware
> makes the button also send events normally, so that it
> can actually be used as a normal button.

Can someone roughly explain what's going on? :p On my HP Compaq laptop
all those "buttons" work, except that one "info" one. How are those keys
being emulated(?) as my regular keyboard? Why would only one not work?



>> Dennis, can you check that your device runs the latest BIOS? And if
>> this is not the case, could you do a BIOS update and send me an
>> updated acpidump? The reason for this is that currently, the button
>> device receives only system wake events, but no button press events
>> during runtime. Maybe this is a BIOS bug, although this could also be
>> intentional (fancy power button).
> See above IIRC what was discussed last time this is
> an intentional (mis)feature of these buttons. Chances
> are there might be some workaround for this for HP too,
> but that will likely be tricky to find.
> 
> Regards,
> 
> Hans
