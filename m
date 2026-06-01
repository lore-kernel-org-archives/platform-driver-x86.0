Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1518F25B095;
	Mon,  1 Jun 2026 17:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780333880; cv=pass; b=c8un+j+nRVzdlsqVYCrhcLOZE7w0P5s7XSfmh8cPKt0KKilOx6q2anvoIdsSLugfSzcyhBvv5RFhUoyHzNL2HrLkVOxMiSdqTkiQc+xP0HmtlkgoxCoRBqnvQJwHKSomBiCR68tp2r0kmVwEgJMwiv6bsfxtgL1MRXgxAsvSO4E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780333880; c=relaxed/simple;
	bh=OUFSx8D5yd3IJGUZT9YA0mZTmiA2IboZgTeO18ubzp4=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=FL5aDMKqFFwHFnRDTpDy2+/B4w4QDYLAOGOHVn707HvUbjgvh5Q6FNVeG6OKBa0bktS2omDCHQhsrjErWsU/si1jGF/oS2GI04UrgfNiiMLsmehiBdxjkNu/uQgqDGvKAcL9NvLFDgK7NFjTW2omEdwrojQYsFDaQqNHObEO4lo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=KXk4h1hI; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="KXk4h1hI"
ARC-Seal: i=1; a=rsa-sha256; t=1780333870; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=FH8F2usIV/MBCn6S2+Yh0RwJaqkPxZe9FZ21hleIxZqzhpBNtbJ74KEgqO2tYMZfEzhCYh4CnkAxz/lwvg2QYnrPKeBrOwkLqNYL8Lk1vhx2ubiaozJoxjqEMoI1uxQbVvhs5IqQu0cwWX5/QFko21x264MCwW96nsDjP7fOy9g=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1780333870; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=BefIg+0lfDyFoqM8z1Xps57UbZJW0VsUzrrSvNqWlWs=; 
	b=cKu/weelAod2iTJjXMRTkY9FurWkilIx25E9Tej8QJmRPr+zVwIBspCGH0AMU9vNrM1/YIJXGMNCXNAK/d6XocVLMTZCNi1ToX/JDfzvfrkg2JVZ2H2iDxHcZ6uMAi/ujNXS2qVw8pLvBRApikE8ZRTHEzmqA/89zTGZlDB0HbQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1780333870;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=BefIg+0lfDyFoqM8z1Xps57UbZJW0VsUzrrSvNqWlWs=;
	b=KXk4h1hIIgG2TbmZDt3nheuDggF2R1n6uBeyw9CjtH7jhL7oeOWaVrfiW8zX32uw
	zDVZIpFyX1zvp5KpLzunRiN72usrk3XsPR+WYWctYu26/OZ7ba5WPT2t0qqKZpGTLRp
	WztAbD4w/xQ2GA5fJ+TsjGfjgldDtaHLnJGgaEU0mvY8nP//yEy/FfvNpup3rH/hVCK
	3zN9FSmqXXGTw/xCmWkGuEdwOakHcoXK21RyAk6U91BwjW1brcfcvNp7SvNsOTsQYS+
	eNCsD10ZnijSOnw35EqRTUOR7bffRVuPyiC0x2DVJOCl2QbUuhk76ISsUhp+qGG5F4t
	ivy2/N0xrg==
Received: by mx.zohomail.com with SMTPS id 1780333867534408.81418342105485;
	Mon, 1 Jun 2026 10:11:07 -0700 (PDT)
Message-ID: <43fd116b7612f47b9b97656ea200b591d4235d35.camel@rong.moe>
Subject: Re: ideapad-laptop: Fn+M (Touchpad Toggle) not working on Lenovo
 ThinkBook 16 G4+ IAP
From: Rong Zhang <i@rong.moe>
To: Gillian Laurenti <laurentigillian@gmail.com>, 
	platform-driver-x86@vger.kernel.org
Cc: Ike Panhc <ike.pan@canonical.com>, Ilpo =?ISO-8859-1?Q?J=E4rvinen?=
	 <ilpo.jarvinen@linux.intel.com>, Hans de Goede <hdegoede@redhat.com>, 
	linux-kernel@vger.kernel.org
In-Reply-To: <CAB4tWGWi6GjU7WrPzaPMRF3gSZ4zrD9xDArbuGcNMwYmaMWCwQ@mail.gmail.com>
References: 
	<CAB4tWGWi6GjU7WrPzaPMRF3gSZ4zrD9xDArbuGcNMwYmaMWCwQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 02 Jun 2026 01:06:02 +0800
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-9 
X-ZohoMailClient: External

Hi Gillian,

On Fri, 2026-05-22 at 08:25 +0800, Gillian Laurenti wrote:
> Hi,
> The Fn+M touchpad toggle hotkey on the Lenovo ThinkBook 16 G4+ IAP
> doesn't generate a keycode under Linux.
> Pressing the key only triggers a generic WMI event in acpi_listen: wmi
> PNP0C14:03 000000d0 00000000
> Since the ideapad_laptop driver already handles these 0xD0 events by
> reading the VPC status register,=C2=A0
>=20

On my device such events are handled by ideapad_wmi_notify(), which
doesn't read VPC status registers at all.

> I did some testing on this model. It
> looks like the touchpad toggle state is mapped to bit 6 of the
> register.
> Can we add parsing for bit 6 on 0xD0 events so the driver can report
> the touchpad toggle keycode properly?

Did you mean ideapad_acpi_notify()? On my device I didn't see any events
in acpi_listen when the callback is triggered by ACPI notifications.

And bit 6 for vpc status registers has been mapped to
KEY_SWITCHVIDEOMODE:

   static const struct key_entry ideapad_keymap[] =3D {
   	{ KE_KEY,   6, { KEY_SWITCHVIDEOMODE } },
   	...
   };
  =20
   ...
  =20
   static void ideapad_acpi_notify(acpi_handle handle, u32 event, void *dat=
a)
   {
   	...
   	for_each_set_bit(bit, &vpc1, 16) {
   		switch (bit) {
   		case 13:
   		case 11:
   		case 8:
   		case 7:
   		case 6:
   			ideapad_input_report(priv, bit);
   			break;
   		...
   		}
   	}
   }

Therefore, I guess there may be something missing from your experiments
and/or assumptions.

Could you please add some debug printks to both callbacks to print the
event data? With additional information we could hopefully figure out
what's really going on.

Thanks,
Rong

>=20
> System Information:
> Model: Lenovo ThinkBook 16 G4+ IAP
> OS: Arch Linux
> Kernel version: 6.18.31-1-lts
