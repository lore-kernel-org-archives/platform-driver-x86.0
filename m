Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793267083;
	b=mhnyVGe4lJN0ekDa4aGsJxE20dt8YOTsNuD1U0IkzevZskD5Hv3oKlBimftwxilX0zD1
	 1BQ91UqSd63zhZYIoZegvaQJ5VukJ0tYdu+xxepReCSxx3KMhls71nbRya/hox1VVQk7X
	 1HsB3neVfjOr/EBu/ttCR8ul15a82DV0VlTDQR5bseD2r2OROoU4QvQTXimPHBD0Uwo1V
	 mv5JXaEilmV0BeWtSt1CYiBt3rc40qxIxdz/d0oo3vq39iqsV6bkWnSHNqpgoDsa3pv23
	 NBsUBuEhxEFJNw+yjR3OqbZiP83huvpK09TKTR5ACyN2lhSlDjAI7oqxXVfrM0pMjjA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793267083;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=C5AKp4+CeD1moxDo2SesSWYIqu8sKelKqQVsYukSFeg=;
	b=BSx4Ivwcd733ccZ6NGKZsDYzVUApob+qkj+G1w2P25AfO74YN4U75ktOtljDXkV8Q9xb
	 40s9lrUA+Oh9x/qA2nA3h6Nlt2K1dhkX43OxVINdUPaCk0DCuIMHSYrnh7UYG/MEFC2uC
	 j8qo4J7PR55I8lRsrJHmVY8yNu7NiuG1X5Lo1itPW73raPmITtStnxxSZD/equv/8lmDx
	 K4EBEiJ4bWjplGjeOZqJWnm0n9gUQ2J38uPxs3gcbIsKS3fwowkyd5QkbtOCkREWUbgBz
	 gXKP6P/WAA1EDVmIDFvZr7gPoiLo+xcK2AI//wEpvS4cPHPTVgh3fpzMcNHIR0/u+nA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=viduli.io;
	spf=pass smtp.mailfrom=viduli.io;
	dkim=pass header.d=viduli-io.20260707.gappssmtp.com header.i=@viduli-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=pzzvOGcK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E1C8606A320
	for <platform-driver-x86@vger.kernel.org>; Thu, 29 Oct 2026 09:44:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E1C8606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=viduli.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=viduli.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=viduli-io.20260707.gappssmtp.com header.i=@viduli-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=pzzvOGcK
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b1aa2848d2so3361063a12.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 29 Oct 2026 02:44:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793267081; cv=none;
        d=google.com; s=arc-20260327;
        b=l7s0IJpUK1bY0WeZsCPowaCqsTR//Oflyta+6pwjPevFbGe8ZGOTinzUXINqazRb02
         uxi46hymBgrUCzgP4fuVIbz4FYC6o/XuDonc2YspgdL6ArKDaERt5Mxcr88q44en7fsK
         /aWVsYkoadiWOG7rtAqyH5l4TvxwXhKp1HBx86yVDa7soxKrvBmJE8vZM9bZzVSIAW6d
         idBCdlYhYGSMQ60zfhpgU7SYC4JjlZwKvbwrqxfyh4yWspUwcwfJgEGHibB5nsmpQJm2
         nxeUADmF+JsvhxGarM8EVJsR0m6vnqfaKydfcaMVYVbxdG1+Lm3QrqqxwDP46Wog9un4
         +ayQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=C5AKp4+CeD1moxDo2SesSWYIqu8sKelKqQVsYukSFeg=;
        fh=TghFWpydv/mCjMw69KP7xF/tGoUqBzMBp6MV+HkbwkM=;
        b=U5G7P7IHCz79XCYSXIPfPMBWa3M0vAcaG3t+0QuKCgHwjGWQtxB/n0pSusaMaiTqnW
         mYSoXX/6dl7/ogk9xJXz6zNeTU7oFPyhsdYwe6x4FT/JXouKjeLunIYKQnSElLShY+bE
         Zpl0HsM7D1IJySwTgCwATmpjAZAq+ttbm1oZ699AFpWGIiKMeZFsl5itNAg1xUAOs3ST
         BcaJsdzXUYBdDfILCw/HI/axEBCE83sKCh8k6Ce11busypwEjyjh5cqjfbktoGCfnD12
         f8C5eVlSAq4WtALDikGILjdWAKt6JIRG/vBz49BUMy6RuEZpai4t2HxAYXBi4GILkdxW
         Tkeg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=viduli-io.20260707.gappssmtp.com; s=20260707; t=1793267081; x=1793871881; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=C5AKp4+CeD1moxDo2SesSWYIqu8sKelKqQVsYukSFeg=;
        b=pzzvOGcK90z69/r88uN/+US6MMVCyRsTH3HmPWDVd+4jQfRILSoRS0KjAZFRaY8By5
         0l/p+KfvuXIh3gAtvpXKzfqCKKBo0a83gZ3E5gghiBi1aagqGY0Vl6yxtqYf1eBzplyg
         98B2mxh9YoIjerxv5PDE16b9ngdZT7ya9l0xll4H76veDxJoSoAHrl24YG6OqyOPRdOP
         9bgkjRBgppZC/yQy68MXq+GnfjV1duXyn08JX2rPqgaLX28sHIMLFAGtJ0+ssdcXCPRX
         ipdruT6+tQmLJc2hHb7Co1EQloZVZ03HytL16OC/Z3oDHVI2xVFODMfDlFcj0sSzxNPc
         6WVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793267081; x=1793871881;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=C5AKp4+CeD1moxDo2SesSWYIqu8sKelKqQVsYukSFeg=;
        b=U8hTkCL7EzbBu7NwYwKg0NkLkB+cJpOiw+XJvuvbrcAAmW2X9soAwnZzSdOJPMrjbq
         Y38W8pILQVIfggg8xmcNo3qQSyNUiz5sIV8fwQPUennqWd/h05Ru9poItYEiN3lnr254
         /eEz8zh9Kk13EEMed0lHZg7oCHyrif6qK7BnkTZ+LJycylKDxWhIRI2URmaCttgvgrWU
         QuY7ZXXM5gkmD58JxLwT25MB5bSHPoBc0eyTNE7W0NMtnQkx0uYLQTnBQ4qhcXqIj8te
         r0qpe8Ep0pO0uWqIVPBXQpnYvDDqLzE+c9nBHoDZLshnaWhag2PeOGjspJC+nhdB9AKM
         ykig==
X-Gm-Message-State: AFq9FYKvrjTog3NPRcBs5+/K3cwfmurmP8ZCbXrp8VzIh8aEFTXYw0TU
	kXFPsyN9DqlYMGLUz/gHNcvIa9K0ZKVnGtWbG4ebyvU9CHAdp5QfWPdZxh5FgkfK4NJ2YM3o5J2
	h+o4yE6Kwwa1js17j/wJF3RD+n/8oI79PtFum18QZdrp55bPrgjmlYujmD8A=
X-Gm-Gg: AYBFou1h57JXq06jK+mjRxDlSJJSg/bFPS/Q6Hl2L6txDX3vt5b/45Pqkpgwp+Ggclx
	qb7TQeJs+8j4l3UZzKZq0MjBRyIollPG+22dLYSQL6oAlvTUGshP+X8d97+AePFJr+7fbu7IuZ+
	E0XLXVpA3x01ei6eLNBy+Q9K00URvJmU89J+5slr7n8DhnJfUkzwMW5uy5Y/Vvl+eK55UDsZCxz
	3GIMm/F2l6iPrixh3ar41r7qI1GqaR/GdHTsvfU/8XuuIcpHcWbzRCAZc++6OR2CbZK/zWr6Ibr
	M/aRtjbQAtBpt+MTDO27nvWAZ8k4H9fRqnq8WOawVODeQe6x+e3+8WbecuO4354XgiwyWRfaXzD
	NyO3dH9Kg13GYDDLdzJWASX3ybrOo9m+GjvqTgu5ygm34NwnZVaz45nP3luMpSFX6rfDJ/9FyJ9
	LSnEA/0luLshj4d/S+QMVLVByW
X-Received: by 2002:aa7:d403:0:b0:6af:5b14:78e7 with SMTP id
 4fb4d7f45d1cf-6b49cc1095amr2402966a12.34.1793267080586; Thu, 29 Oct 2026
 02:44:40 -0700 (PDT)
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Avin Kavish <avin@viduli.io>
Date: Thu, 29 Oct 2026 15:14:29 +0530
X-Gm-Features: AclHuK8jsxRYcUTbMMeb62kd2j5JRJsqiJWpa2dWokLwwhI9nBQNW21gNtUd23I
Message-ID: <CAPvnYKKDu=kG9Nh=zFtZQjWtS-G1J4KYcWv8cQTypdGN7f8TQw@mail.gmail.com>
Subject: Missing support for Asus Fn keys
To: platform-driver-x86@vger.kernel.org
Cc: "luke@ljones.dev" <luke@ljones.dev>
Content-Type: text/plain; charset="UTF-8"

Hey folks,

I'm on board FX608JMR (Asus TUF Gaming F16), kernel 7.3.0-4-cachyos.

The kernel doesn't seem to be handling Fn+F4 and F5 presses - AURA and
Fan keys respectively.

acpi_listen gives,

wmi PNP0C14:03 000000ff 00000000
wmi PNP0C14:03 000000ff 00000000

That's probably not helpful though, it gives the same codes for the
keys that are handled too.

I did notice asus-wmi.c added support for the fan key in line 4733. Is
that post-kernel 7.3?

Some research revealed I should disassemble the ACPI firmware to find
the exact codes to handle, happy to send over the firmware if
necessary.

Regards,
Avin.
