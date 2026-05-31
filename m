Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE942DAFDF
	for <platform-driver-x86@vger.kernel.org>; Sun, 31 May 2026 12:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780230846; cv=none; b=dr8/DFtVc1++NldoI2h93OV4ES7wnO9b86PYTNNzI6CfFStzzLxROhDBKGHvislulo2fMdpWPsWb0x241SZMGRHFW0ah+3nfwCVPZutHvZmQaXG5K9SI5kd+iBi2vhkmAl4lhCYNombrLzs1x0NXTJiTEwpiUUTxDajkkdlU038=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780230846; c=relaxed/simple;
	bh=qTkZbVGMUL3NEgtu37cl/uUUNVvI9tBJtM0KsV8PXVY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iHm6JymgQluZ5M01Cr1GW+K4yMlZxgE8gyN5H1++/fO4eniNegQI6hOAqD8e91VwH2R78edY1Gqvfh17Rjzu1/65E/qDv9s5lIEhvGGFEoCzBZnyC5dceJcuSMwjQeQFzTSfopwFduRr/vOyHWDypMMwbr5bLCgHPr+Py1G87Rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nikableh.moe; spf=pass smtp.mailfrom=nikableh.moe; dkim=pass (2048-bit key) header.d=nikableh.moe header.i=@nikableh.moe header.b=c98aRqBi; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=f0odCqaF; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nikableh.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nikableh.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nikableh.moe header.i=@nikableh.moe header.b="c98aRqBi";
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="f0odCqaF"
DKIM-Signature: a=rsa-sha256; b=c98aRqBiIjSoDKqRa1HV0VcmsKwWuxs+M2X3TDtNR/obfFs7W8IJKo9a7ooK/tqVDXisyOUwNxY3VAW6FhHoz7DqWyz+IHuo0UH0dNcQeOAtb2s7g0Xdyd8UmCcROIF/ijCYfd9JWO7HpxPyCGIBUiQjKunbHY+Arka/tGal/d3tZc/5azgGgtArTAwbeT8tCX8oF21EzDB9xiPbPn39gImgbtgkQfakI7ihAKZMYST8BshXosbwM33f6XCK0p2y0iz5OEECK9ND5s7b+3zPb4M7p8CTe3zFjo+gLbOUXVk47Zi5elgUxeXZd6ux3y4QECIFdeY0GJ13dX+aaesGFw==; s=purelymail1; d=nikableh.moe; v=1; bh=qTkZbVGMUL3NEgtu37cl/uUUNVvI9tBJtM0KsV8PXVY=; h=Received:From:To:Subject:Date;
DKIM-Signature: a=rsa-sha256; b=f0odCqaF+JIDGBMh6V926/d83XKTlxJzA8TPB0cnCAmi7fdbSHFXSairZSFhJNTZ7kKNiVNQHSSv/ealNTEfAek+PwsDmQ4BIU68MBIfAQNGqeBY7f+a4J9+WRiw8bVu7532bCtMeWsz5h3cyWwXh84r8jd6s7GSS9vd3EpkuCzEHOWFBE1igmUUj+uCtBHLC8NUoHqbzWoe03n/DvEjELdtksjaiaNBhcG+RTQ0DIwla29JgWrWa1xDEGie814BHuelrFwlZzDhr/OJfnQO7/TFNrREnYMQrj99q0SiTymiGPEt+jtcSW9GTvCJJAaFA3b+6RJwINV2ggEyZS7E2A==; s=purelymail1; d=purelymail.com; v=1; bh=qTkZbVGMUL3NEgtu37cl/uUUNVvI9tBJtM0KsV8PXVY=; h=Feedback-ID:Received:From:To:Subject:Date;
Feedback-ID: 209604:18551:null:purelymail
X-Pm-Original-To: platform-driver-x86@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -761922559;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Sun, 31 May 2026 12:33:47 +0000 (UTC)
From: Nika Krasnova <nika@nikableh.moe>
To: Armin Wolf <W_Armin@gmx.de>
Cc: Gladyshev Ilya <foxido@foxido.dev>,
	Mingyou Chen <qby140326@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org
Subject: Re: Missing ACPI driver for a keyboard button in Xiaomi RedmiBook Pro 16
Date: Sun, 31 May 2026 14:33:31 +0200
Message-ID: <20260531123345.237521-1-nika@nikableh.moe>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <35144cc0-9718-47b6-b182-592d208dc24c@gmx.de>
References: <35144cc0-9718-47b6-b182-592d208dc24c@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Content-Type: text/plain; charset=UTF-8

Hi Armin,

(Reviving our thread from last July -- apologies for the long gap.
I'm the original reporter; I've since moved my address from
nikita.nikita.krasnov@gmail.com to the one I'm writing from now.)

On 28.07.25, Armin Wolf wrote:
> Since another user recently submitted a WMI driver for the WMI event
> device in question i suggest that you instead focus on bringing this
> driver into the mainline kernel. You could for example test this
> driver on your device and report back if everything works.

Reporting back: redmi-wmi binds on my RedmiBook Pro 16 and the mapped
hotkeys work. The mic-mute key (F4) is missing from the keymap, so it
does nothing. The firmware reports the resulting toggle state in the
scancode, emitting one event per press: 0x00002101 (-> muted) and
0x00012101 (-> unmuted). I added both as KEY_MICMUTE and tested with
evtest and GNOME -- the key now works. I have that patch ready to send.

Before I send it, though, I hit a question I'd like your guidance on.
While preparing the patch I found that bitland-mifs-wmi (merged for
7.1) also lists the same WMI event device in its id table
(GUID 46C93E13-EE9B-4262-8488-563BCA757FEF) that redmi-wmi binds.
Neither driver uses DMI matching, so on my machine both drivers would
match the same WMI event device and only one can bind it, depending on
driver registration order.

So:

1. Where should new RedmiBook hotkey support (this mic-mute key) go --
   redmi-wmi, or bitland-mifs-wmi? Is the long-term intent for the two
   drivers to coexist, or to consolidate?

2. Is the GUID overlap between the two drivers intended? On hardware
   that matches both, how is binding meant to be resolved? I'm happy to
   send a patch in whatever direction you prefer.

There's also a follow-up I'd like to fix: the mic-mute LED is toggled
autonomously by the firmware on each press, so it drifts out of sync
with the actual mute state (e.g. after boot the LED can end up inverted
relative to the real mic state). From the ACPI tables, the LED state is
the EC field MIUT, which is get/set-able through the same control
device that bitland-mifs-wmi already wraps. So a proper
"audio-micmute"-triggered LED class device looks feasible; where it
should live depends on the answer to (1).

Thanks for your time and any guidance.

--=20
Nika Krasnova
