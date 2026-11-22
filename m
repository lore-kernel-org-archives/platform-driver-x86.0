Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=168.119.145.117
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795382701;
	b=XzUhMWj7JOWiBBQj+uO1TXjduXniSSgO1oPN28a85gWUO05k3o7E5A6WMpCz6bpxPTS4
	 jvZWNLViO0abb1ZxKWHjKmYRtCdwEEP6ejNnPvJE9OLtNByfkwmDbZR6FKT+MIz50Wb8T
	 +Mw7qXQxes0frflaM3CMVUa/Fz0vH2zZ2Ar+u8xxX7/7qCPE/FVJZpvVrJTipTSg4VL/z
	 W/UYex6H5OWWsMYIu+smF9doO/38Vr5ZOdsJ29IjmVJHAMnohrWSRtk6E+1Qq28yol3c6
	 WHHh5nQk/fdotXAsDMzw8jgZsuIHL9McNhjTDulLZcXLj+i3A+0VJYSuVv11/b8WTzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795382701;
	h=DMARC-Filter:From:DKIM-Signature:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:MIME-Version:Autocrypt:
	 Content-Transfer-Encoding:Content-Type;
	bh=mVOxxf5mYPV0D0EQ9CCc8NZCE2661FlwEeATv7pgK/o=;
	b=oAQRQ7qNmYILd+jGRULb0v4oP7VXbTTbtsm83mFyCZI8GDzvXWloOzKbHnmUGZwFA/0J
	 ZjlS1PShTZODUBTCJz79gfy849LCmIGWyZZ4vmxUW4HkuLNzZwgdFodhhbTZwFjbbXhNI
	 55bZpliKteDO7xOOm1BFDjCgmKZiVdlgT9lEW0FJbwRB5VTGnXK03byu+qf3mDz7bN4/j
	 fSKtNG2HeHK7IEYiDHsvfK/nT05MJJDvTFPjYOm8EbK5CA11+gt7u4L3X8XdUtsuWJJTZ
	 H9kg13ZuutmNyWJ/2cO7annm1110NOMlR4oGfyrUdK0+oyZ+4wEaTt7JbjoYxz74Atg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=0x0.st;
	spf=pass smtp.mailfrom=0x0.st;
	dkim=pass header.d=0x0.st header.i=@0x0.st header.a=rsa-sha256 header.s=modoboa header.b=F6K+UmeW;
	arc=none smtp.remote-ip=168.119.145.117
Received: from srsfckn.biz (0x0.st [168.119.145.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F19C8606A31D;
	Sun, 22 Nov 2026 21:24:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F19C8606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=0x0.st
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0.st
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=0x0.st header.i=@0x0.st header.a=rsa-sha256 header.s=modoboa header.b=F6K+UmeW
From: Mia Herkt <mia@0x0.st>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0x0.st; s=modoboa;
	t=1795382690;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=mVOxxf5mYPV0D0EQ9CCc8NZCE2661FlwEeATv7pgK/o=;
	b=F6K+UmeWbj2s+QhW1RCGwaSoJV0nfcuZxIiJuWUcp8BsSBy4rs7EZz6pz9+ouDcCNYQhPk
	P8pbrsZW1LIbEldvneGsBx6H9wdS1/LICQR/PciYphhlzYqLeFZt+AYqmwQE7sHsC2bCrg
	XUaNblZkVja+S1COnGMVHWZo6R5nsU1YYEZprwSivt4hMsSQcH2YEZ2/DZf0Sx8FG5Cqmy
	v3ewA0dmn1vgHKMT68/4uPgu+dX0oggCG3wqXxsvQixdFn3LoeMfWZ30P5paxwTtSsyfdn
	Lf5SyTbmVFaI4kpK7dkrqi/lU6tSY5igTScLbgFCBechrWyjOOk8dbuQlKRn5MqFCwyEvR
	ldG2XgIhh7xQQ9KtlkuvNspIq8bMtRbqt66vLq7TLVrPgfbIBum+paQnrYMvRfR5rakJoa
	Axx2QUKupj6ZUQBR+LPwvBCKQnW8R7egkhTNM/v5a/uI54XM9ZsHbjir0MrR4j/6IZF6Q7
	7OJxF7JckWkr2e0A/c1/LRhwBoLO0aRiPazYR/yCnykXGv7fLdyZaj5dGEIozXrNTJi+eb
	5hfpn9kchuUnedZW0mhpzoNaYZBrV84qkMvU/MPlOBjeNoewbQo10mb7fjEvg1qtj3doag
	4jXhp6KHJdZN491tP+jYsK2v3K2FLBs6eYtM65z5Rdrqd+jzaGtOo=
To: Zane Hunt <git@turtledev.nz>
Cc: "Luke D. Jones" <luke@ljones.dev>, Denis Benato <denis.benato@linux.dev>,
 Hans de Goede <hansg@kernel.org>,
 Ilpo =?UTF-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 Corentin Chary <corentin.chary@gmail.com>
Subject:
 Re: [PATCH v5] platform/x86: asus-wmi: Add support for
 ASUS_WMI_DEVID_CAMERA_LED_NEG
Date: Sun, 22 Nov 2026 22:24:48 +0100
Message-ID: <nHv94wFvQJyCt2jjVWdO5A@0x0.st>
In-Reply-To: <20261117-asus-wmi-camera-led-v5-1-41c47653758b@turtledev.nz>
References: <20261117-asus-wmi-camera-led-v5-1-41c47653758b@turtledev.nz>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Autocrypt: addr=mia@0x0.st;
 keydata=
 mDMEXmvDmhYJKwYBBAHaRw8BAQdAP4VA8yQB34TJEzZaYygdNeelk/2sUvOpVSK5Mg/gVee0Fk1
 pYSBIZXJrdCA8bWlhQDB4MC5zdD6IlgQTFggAPgIbAwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgB
 YhBM1dSFDmB4CO/P9NbHLhVLhiLsGRBQJqIFOLBQkMzGwZAAoJEHLhVLhiLsGRmtcA/3cUO4U/k
 iYaBPxIHREmltd2Nly4e1bTHcq10yoiSjIGAP9hYHlhYfkORUVcHLkaVCD/Z+2TQEWZUFQO0KPb
 K6IjCLg4BF5rw5oSCisGAQQBl1UBBQEBB0BASQVMxF6j1EExV6BkhCyslvJmW1leTgw4fnyleI0
 QIwMBCAeIeAQYFggAIAIbDBYhBM1dSFDmB4CO/P9NbHLhVLhiLsGRBQJiXuuHAAoJEHLhVLhiLs
 GRnF0BALFShluzTqHUgZOoQJQRf39TTJEKs3mrNp7zhMLkHZ4VAP0cAICVm9XkTrg0jfsbXj7ok
 Sjp/rwOFaGaFxmxIFxwDw==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Monday, November 16, 2026 7:37:38=E2=80=AFPM Central European Standard T=
ime Zane=20
Hunt via B4 Relay wrote:
> From: Zane Hunt <git@turtledev.nz>
>   The key event already resyncs the LED, and skyedryv's s2idle test
>   showed nothing gets missed while suspended (Jos=C3=A9, Rong)

Unfortunately, on my Zenbook S16 (firmware UM5606GA.307), the camera can be=
=20
toggled in s2idle, but this does not wake up the device and no key events=20
arrive after waking up via other methods.
So with v5, [disable -> s2idle -> enable -> resume] results in the LED stay=
ing=20
on while the camera is in fact not disabled.


