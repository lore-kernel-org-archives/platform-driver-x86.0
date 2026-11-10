Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794342854;
	b=InhEnoZbsb1CzWvhvNcO71UuYaSudRp3KLl1TnyuaumFte8hNRsNRHfHGg5Fgm/OiAmh
	 vUhHqmSYFnwYR6KSVl3gylH8JRKbme2GvIqCcoNv+nUAFbxjTkKJhquzRAk8CSzRIdLvy
	 uVHQNZdqB3hsWahHalN4lGMOAWDIpdm+VPX7CTGJ+CDuMC+8Mo98PvWdF8JFAer/apEpI
	 8kfXiI/4Yohx4brYykVmHN1zjV+tCMndkMXERPPZc+rIDHnY0Q2J4opey6qsfj8cXPJqA
	 R5uBRBH2ZbHANPgaWqSfS11iCFmPBgwhmA7538m4PpHSGFGendHhoTfewEMgnBDgHFQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794342854;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=S3yevQWR0QP2Mx5vcqLjpBrtJN6Cj5pb6mimG15JBzw=;
	b=Vcg+qGLhWmIs4hHwYJGA9JkhYC7meMSDBaMGN05kpe+SjYMk+ENIUtu6QZyqtuGhGXa7
	 syWFx2vLtcOd/ivRrR0TvQohuCguyY9TZka9KwbM7oS5K9a6NT+dfrxwOIJr44DQrs/3X
	 wzRifBLnogz7I/hhqf1ATi8m8+LwcYctZedqkntMJQSBPlNmwJig7ywDKwq9X4apEHD8l
	 y/5PPKObKZ0i1I7sBI2zbcZccqOv2MWvUxSu9r9ANBZudoDH+nXO+Fyv/eenDuWvCbw97
	 3+CpqgZAQxBmJDTv+GOBqbwidG4HNgznEXDjWanl+taXqHgkzpGz+144TxwYchorsuw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rh+jOjak;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 175E1606A327
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Nov 2026 20:34:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 175E1606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rh+jOjak
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1a3c08d6928so4260293c88.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 10 Nov 2026 12:34:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794342853; cv=none;
        d=google.com; s=arc-20260327;
        b=j280HFFr/haYJLR6CWtIh5RKFpUKt8Cu4jtFZfEEZoO3EdjpuC6BNg5mFTfJfk+exU
         T8hbyEmu0NfCjvqQr5n3v3pxOmM9ghdKnPBej5IYQii+ZtAGLJttgZevIIJjNjtSOC78
         8kVgeyPVvNSkklkv0hTJvvuspJuzGO72MqvR+7L44zpZ4faYye9RqAvcrAmtX93BKaFj
         frdH8Cu/BOkl3VxGLiHPrITSSl2DkKUvj8VVpgMp0EOZLNfRSTKx1G4ovJ/AL2AcJxP8
         HaqwycxfF0FdSXXK6ZozSWSCEc3IFeacApn4Rj1Ub4Vb0v9eO54V/OMTNPiIzIeNDdZO
         0QJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=S3yevQWR0QP2Mx5vcqLjpBrtJN6Cj5pb6mimG15JBzw=;
        fh=FJfF47IH0K8d88q4vdYCDf5QhsPjweNwb/pVg2YN00U=;
        b=LjexGSHs4rrZ/MGyfZQPE5yNKN+2H4Jh1OpOA/gg2q61PRDz069g63r3++OgsH5V9e
         qhs3AHMaf6JsatjnumJjEFQNrEZB62n5SvUZUCwyixT2qcjZii4whjrt0TN4SCX8qOgJ
         5rwPmn27HpfJ4P+WzSF/jStGKJCluupHLaEcOXzbfPmK6OrJVd7gjQamgOUawT80wjgS
         IoKyXnmKPyMCQqPD9U3KBmq/PMkuu2s4oSWzq8jxcgsw81HrYi8u4q2vmXhTGOV0kNbp
         kCPZyvPX91eNKMXCdkmT3F+ODgTILxPe6tQsIbwSsjsbI5JL1u7ujVtTb+x2wRHTkdft
         vmbg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794342853; x=1794947653; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S3yevQWR0QP2Mx5vcqLjpBrtJN6Cj5pb6mimG15JBzw=;
        b=rh+jOjakz1G2mhKn7qUhYjA2f/PgbfhMztkjhsL7VKNEErg7iKclTlsgl3qQW1kwfh
         /3vViQlVc3y9xHIaX1bp4vH3xLFW1sZXtLNWciRXBfBPAsuqPLVc7XfnHyPD47R0wk+3
         HCkYrHGw53UOuL5i1hpGyVEL3qLps5eKTGbiSNulzmeW5/64EaZt1cjbas3YaO/IqkcB
         +mhUjHTZJKbLu22kIFMrIT4rCmLI8v283sXOh2zhWVeYqQz/z7X3UedPxvVsCzmb562f
         eBbM4JymaUo/ibQGFrYZAdEA0Ia+yWq2D3wQdzg3Do0MMnl3btYVVi7cp+2Rf8VL49ze
         E70A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794342853; x=1794947653;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=S3yevQWR0QP2Mx5vcqLjpBrtJN6Cj5pb6mimG15JBzw=;
        b=ZNT4ZlHxMAsalJQ2mtubuLbI55ZS6bMq2d8ZHzLuG31cblLUJywTj6hX3wKwYEt/8F
         4CKeod94qzw8iPqUhqqHzCY09cFwvKtRpI0dCou5De/BXi9QCWB7KS619qE3oKwYK0c4
         v/5m5mjaWuuoVZ5QYK7HlYtEGkvkjjunZvWN6WJQikpMZ1m6G8H3sgUYLsBuOA/dypZN
         5Uaz7Uy3H7fdZU/QuY88iMqJxNcFpYjXlcZG79uYnKvk5LDY20sQPIgPEwrbRk9l7//p
         d3ytwrD6pv35uV1CEHXU/WTJMLS8oGxSB3OHVLKUcPyNmRun/zio/zEl8pj5Rp3+vmIM
         YoTg==
X-Forwarded-Encrypted: i=1; AL+hErGpc1K7qHSpwM42SQZRaULTIjcHTzqaEPdNBdhW1ajZX033qLxFGUtbtCwVETAvaldqrD58aDUMGSf+2P/YVoupaUfz@vger.kernel.org
X-Gm-Message-State: APuU4Z9cI6JqcxZTovNZpeIGfNFDqqGgsFjhcpvNWSG79q7mMh5+0cKE
	8la0Mgv8wFpaFy5gPtTWaKMnLXZcQHbBJ6Uq9oMmqv5gE5zVUJJdwZPnccHlaxAJ9/bI8y/+rD8
	2pRbim2wFBdlo4ArmJaMaz7r2EkNl0Is=
X-Gm-Gg: AYBFou0hmXENBMYpHvHVRguWOzjaPIHu25uz9hVLdKlnplbXHbArvw/Py/qeJTvQS01
	4Dn7z0lbn6661ie9zkhiOzPz1tvDLY0I43wJwJcvV7NN+ykh19LPfLkmy85bKs4SdQhhKvX9JWo
	QCfmdwzaOCSGq+z7uve4e0veE/SEQDHhX/WEvpVlFF+v2yH1Vt7oVLvifiE555yAJcu+AuiiK3c
	owOob7b3OQYcNfKTncp80akFwqo3Y3Mj18AW6J8XkYcYmzv3Y2ZztyiZ6INOJwIqLFLQAkfzPGa
	c+s8kH/3wd6tv2/5BLbp/GnSB1EO56DfTiBp/NSAcMCOUz7GJ5TW7WQN4hTs4+neH45RKub6m2d
	K/X/+HPUsdU7+M6ogz/4wog==
X-Received: by 2002:a05:701b:4354:b0:1b2:4b42:1870 with SMTP id
 a92af1059eb24-1b3b60122e6mr5192830c88.31.1794342852985; Tue, 10 Nov 2026
 12:34:12 -0800 (PST)
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109-legion-lighting-rfc-v1-0-a87e1db8c5e3@gmail.com> <71ecff766a91670d509b1286efd995b71efc21f4.camel@rong.moe>
In-Reply-To: <71ecff766a91670d509b1286efd995b71efc21f4.camel@rong.moe>
From: Ciro Pedrini <ciro.pedrini@gmail.com>
Date: Tue, 10 Nov 2026 17:34:01 -0300
X-Gm-Features: AclHuK-300J_C-DWjExk6OeF5Jmrb_TP8ZwYUDbSNJSRs61knDywMdBKoecE0iQ
Message-ID: <CAPKD0HduW_atYsz47Nv-9A_88K1B33xENUnZgQAKcH4VHqV9PA@mail.gmail.com>
Subject: Re: [PATCH RFC 0/2] Keyboard lighting for the Lenovo Legion Pro 7 Gen 10
To: Rong Zhang <i@rong.moe>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, "Derek J. Clark" <derekjohn.clark@gmail.com>, 
	Ike Panhc <ikepanhc@gmail.com>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
	Werner Sembach <wse@tuxedocomputers.com>, Aaron Erhardt <aer@tuxedocomputers.com>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Rong,

On Tue, 2026-11-10 at 22:56 +0800, Rong Zhang wrote:
> Thanks for working on this.

Thanks for looking at it (and for the clear direction, it helped a lot).

[...]

> Let's take it step by step, and submit a driver for 048d:c197 first. As
> far as I understood, the driver should be able to handle "hardware
> brightness (0..9, stored), the controller's own effects (stored
> profiles)," and "Fn+Up/Down/Space" by its own. (Please correct me if I
> misunderstood your words.)

Makes sense. v2 only does c197, and it doesn't depend on any LampArray
work:
https://lore.kernel.org/r/20261110-legion-lighting-rfc-v2-0-845726afb71c@gmail.com

About your question: yes, the firmware does all of that by itself.
Fn+Up/Down change the brightness (in steps of 3, and it's stored) and
the controller sends the new level on a vendor input report. The driver
only exposes the brightness as kbd_backlight and forwards the hotkey
changes as brightness_hw_changed. Fn+Space switches between the stored
effects (6 states counting off). The controller can also read and set
the active effect, but I left that out of v2.

> I am also working on a independent hid-lamparray implementation that is
> far more generic than Aaron and Werner's series.

Something you may want to know for your driver: on this laptop c193
doesn't show anything on its own. c197 has to hand the LEDs over first,
with its vendor command 0xAA (07 AA 02 00 00 00 gives them to the
LampArray, 07 AA 02 00 01 00 gives them back). The controller remembers
it after power-off, but it only matters while the LampArray is in host
mode. In autonomous mode you see the controller's effects anyway. So a
generic driver on c193 alone would register lamps that do nothing until
c197 is switched.

v2 doesn't touch 0xAA. How would you like to handle it with your
driver? A sysfs attribute on c197, something with your autonomous mode
trigger, the component framework? Once your series is out I'm happy to
write that part and test it here.

> Please use the component framework (not in your next revision, it should
> only add support for 048d:c197).

OK, noted.

Thanks,
Ciro
