Received: from mail.thenautilus.net (mail.thenautilus.net [178.162.154.203])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D78773AC39
	for <platform-driver-x86@vger.kernel.org>; Sun, 28 Dec 2025 12:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.162.154.203
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766923366; cv=none; b=mI3KDp3V30VAn1oOEBx5cw3lw539g77xcWFACl8Ypwnw/NyXe+p27F7t6F3cerW4WjnUylBQvmi1RJwIChLzxlT/L/WUERCte05KranMswj1G4XR92EJZQEnuNemaMAn8qR4AOzrsQYnSS/ooKXErbdBCtX932dpFX85wM0xlq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766923366; c=relaxed/simple;
	bh=wdLaJpJkgD12vcQoyRl1aGycnkMK2c5iqccXGMCaSvc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=eGvUVm0fYF3NJZyxPn3WCp4oVyT4nBdn36Q04MYZ/3gJjT6f8a7V8je5DMySJ0xNL122QzdevkZtrPs5y+Ufk/1qt8Y3V9Kjh0zwG2oH5QH9CPK+s2zFGgNfI7vC4qD+/TpmqfpjTaw2qpGtpnZbaItlfj/yjzzmCI1Ewv8ggIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thenautilus.net; spf=pass smtp.mailfrom=thenautilus.net; dkim=pass (2048-bit key) header.d=thenautilus.net header.i=@thenautilus.net header.b=U/2yThHw; arc=none smtp.client-ip=178.162.154.203
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thenautilus.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thenautilus.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thenautilus.net header.i=@thenautilus.net header.b="U/2yThHw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=thenautilus.net; h=date
	:from:to:cc:subject:message-id:mime-version:content-type
	:content-transfer-encoding; s=20240114; bh=wdLaJpJkgD12vcQoyRl1a
	GycnkMK2c5iqccXGMCaSvc=; b=U/2yThHwYMW79J6T+ueuKngVWR0/OwK/Djj/s
	90pav0Pa4A1rTBHZsN/Rp/viXr5de2ub91g/2KdpkB8MeSQ9a61iDGwzLI5C+/hY
	raFX7LbE8vyLOBS2IPxsvrgz54iAR/lB0O20qCOd8vaZWzdMfVoCoHSYyZNXpZsD
	YqFL0vJUsPbgfFcHFfHVL5+dbLKy/IcniKlo8hQ4rFtmJ6rb/2OFjW24AdFPY2DV
	m1jPhrF89JW4iBnOvqd7WU//J/6ocPDyP4IlMeBWlDnYPczEU9f453VWHSDSPdXy
	x9UFBNvp1WZRkmt0IpxhqiRy6/kHUr//aXgGAtMNNbxromTGw==
Received: (qmail 10018 invoked from network); 28 Dec 2025 11:56:00 -0000
Received: from unknown (HELO localhost) (dakkar@::ffff:151.29.43.112)
  by 0 with ESMTPA; 28 Dec 2025 11:56:00 -0000
Date: Sun, 28 Dec 2025 11:55:56 +0000
From: Gianni Ceccarelli <dakkar@thenautilus.net>
To: Joshua Grisham <josh@joshuagrisham.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: samsung-galaxybook writes to a int via a u8*
Message-ID: <20251228115556.14362d66@thenautilus.net>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/drivers/platform/x86/samsung-galaxybook.c#n450

`val->intval` is an int (see
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/include/linux/power_supply.h#n228
), so writing to it via a `u8*` produces weird results, for example:

    $ cat /sys/class/power_supply/BAT1/charge_control_end_threshold
    78497792
    $ grep END_THRESHOLD /sys/class/power_supply/BAT1/uevent
    POWER_SUPPLY_CHARGE_CONTROL_END_THRESHOLD=-962691840

The least-significant byte of numbers values contains the expected
value:

    $ perl -E 'say 78497792 & 0xFF'
    0
    $ perl -E 'say -962691840 & 0xFF'
    0

even after changing the threshold:
    
    # echo 90 >
/sys/class/power_supply/BAT1/charge_control_end_threshold $ cat
/sys/class/power_supply/BAT1/charge_control_end_threshold 78497882
    $ grep END_THRESHOLD /sys/class/power_supply/BAT1/uevent
    POWER_SUPPLY_CHARGE_CONTROL_END_THRESHOLD=-966918822
    $ perl -E 'say 78497882 & 0xFF'
    90
    $ perl -E 'say -966918822 & 0xFF'
    90

I guess the code could be changed to:

    u8 byteval;
    err = charge_control_end_threshold_acpi_get(galaxybook, &byteval);
    if (err)
       return err;
    val->intval = byteval;

Hope this helps.

-- 
	Dakkar - <Mobilis in mobile>
	GPG public key fingerprint = A071 E618 DD2C 5901 9574
	                             6FE2 40EA 9883 7519 3F88
	                    key id = 0x75193F88

