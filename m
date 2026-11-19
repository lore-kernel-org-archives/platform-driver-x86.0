Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795099142;
	b=RpCfwfCft2/l10rCqIZ0/yJUqLqRf/xG4vj/QVJKacsutVj9Af6kDpG48EHPPmvS2ksM
	 9OMvP87GxVruZhLUlkpnDrhJmzsEmEi8XIMkZ+irPZ9beIlEu1pCnPL4qoGS2A1joT9uu
	 +Owh/Ve2LvU9Cfh98eRzHEkFFcZZ/JAXpvuLHyZShDHDVTC3XrsYH+/eAtAjuXw5uEhmQ
	 3JFwUHk6AvW9+1Ff9GUY4SxfTL8deJ/YcFyL4ntw7dg/TIjfQo6fparO9dx9/0ifnUebH
	 XKGklNhEY+9SBmWIu+V3jXGlVJeZ4ubc/WsNU1rxnPqzW8QIgt4HBmOlMTLbZkiU6+A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795099142;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:
	 MIME-Version:User-Agent:X-ZohoMailClient;
	bh=MMHHkkoxc23bBjQy826GU8NQcyL5syhIWVgroKMdpRk=;
	b=SQ4uy/oQMVzsJWBv/i+jxQSPekruncq7n5O0wA7NkqZKQAh3JKDGd2NIoPd1aPBGXnlH
	 O+/vNGorfkRYkjQ18DESdTqkgoBQJqIhxfaX5wbMyQDaUewjc8TpfyoM50A5cP08LBLpi
	 l18vrFY+rXkUylN53yea8nvwzZzTOnxQJ5DJ+DhCYBRYo50BkWPYgP3etxkpeGGFz+Sxu
	 K4oe6AKpz9Mj7H4WBdNmTgontNHUGGojQDR0MF4K4Baj5Ug4LRfpBfJm1ly7Oe/lkXWNh
	 8E3RhoIK1q37pxj9csoe+0VKN9WwIXuU0wLhW0uF1sZyZB9zHB7FikTaVipxxHrkkcQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rong.moe;
	spf=pass smtp.mailfrom=rong.moe;
	dkim=pass header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=HfnrFIii;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.112
Received: from sender6-pp-f112.zoho.com (sender6-pp-f112.zoho.com [165.173.180.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB0A606A320;
	Thu, 19 Nov 2026 14:39:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FB0A606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=HfnrFIii
ARC-Seal: i=1; a=rsa-sha256; t=1795099110; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=STGpgWs6TUGcrB82dxbjxb9hFNGTFLSACFC4L+iccChP1x5sjuQWEbtM3BUHpPxIB0D7tpHvKRAOJKQN3OLOcLh7Qkw3KVslZXyc7QBLIi5QwWsN0Oh+8+O7jmxJOAu4JBL0Vx2pu7y+r4lgZMOd1tEoZoUf2gE5ltNzd2vvp7o=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795099110; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=MMHHkkoxc23bBjQy826GU8NQcyL5syhIWVgroKMdpRk=; 
	b=Hklt22I6KIl47qF+Ix9Zr8MB/bxSFg1ChM2UPfnAafGo0SneFzVnH2TVLuAHdWvVzsOxBcwPlx/VrgmCUy2A7Cz4C53SUeuA280yNmLiCfuv40GjKwsokvvi6Q+O33k1lZfAOQVz3gX81Fh9K7zQNn8QQfjzt0SoTFXIYR1+lls=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: a=rsa-sha256; b=HfnrFIii510blYu7F9zn1BLGVaJYDe/6daREztsEftjgX0X9jbb9xWfmkVPEikxj3Lcqb3QpEpO9jvLBOzCY99vuajdXgoD6FxrnP84tNlMwGYHrHoTVMqLFtlGFYWU3eroV2wjxSQvqBqCNntWPf8jhmphwcGE1H5lpdJvjR0rCA+kCwq7U5NHcn7/WcGygOwq5adp3UbJrz92RKDMsKsMUZDP+j69yOyijM7+5wE4Gq9QLhMulAhgOdssP2SojiNTrb+/f76/LwbxbRqaAQ71bwxEEPgiHP24/pRdashhEEg3X4F/BOugPHePSh/bt+4KTvviiiRH0gteiV2BuFw==; c=relaxed/relaxed; s=zmail2048; d=rong.moe; v=1; bh=MMHHkkoxc23bBjQy826GU8NQcyL5syhIWVgroKMdpRk=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795099109111716.6663432809851;
	Thu, 19 Nov 2026 06:38:29 -0800 (PST)
Message-ID: <85a6f4cf8b9a1409d343705886afe935952fdf62.camel@rong.moe>
Subject: Re: [PATCH v4] platform/x86: asus-wmi: fix camera key LED on
 Zenbook S14
From: Rong Zhang <i@rong.moe>
To: Devin Bayer <dev@doubly.so>, Denis Benato <denis.benato@linux.dev>, 
 skyedryv <skyedryv@gmail.com>, git@turtledev.nz, Corentin Chary
 <corentin.chary@gmail.com>, "Luke D. Jones" <luke@ljones.dev>, Hans de
 Goede <hansg@kernel.org>, Ilpo =?ISO-8859-1?Q?J=E4rvinen?=	
 <ilpo.jarvinen@linux.intel.com>, platform-driver-x86@vger.kernel.org
Cc: =?ISO-8859-1?Q?Jos=E9?= Guilherme de Castro Rodrigues
	 <jose.guilherme.cr.bh@gmail.com>, linux-kernel@vger.kernel.org
In-Reply-To: <b4d1f79d-770a-4e28-86cb-c3a5fd9187f6@doubly.so>
References: <20261019-asus-wmi-camera-led-v4-1-7744c125bcc9@turtledev.nz>
	 <e212e07006249d68aa7b9df25c95581b307b10e2.camel@rong.moe>
	 <395209cded20a0bdc069b7bc19a68366b62a3f39.camel@rong.moe>
	 <a35a487b-7932-41f7-bbd5-0d0fad2035c4@linux.dev>
	 <4c7d100f18820cba7c4fe6f6fe50c6e3324504cc.camel@rong.moe>
	 <9cbdb61b-9c49-4b31-a28d-022500b271a5@doubly.so>
	 <73a6179232b6db07014d78508c441a6013912e69.camel@rong.moe>
	 <b4d1f79d-770a-4e28-86cb-c3a5fd9187f6@doubly.so>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 22:33:21 +0800
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Evolution 3.62.1-3 
X-ZohoMailClient: External

Hi Devin,=20

Thanks for your information.

On Thu, 2026-11-19 at 14:57 +0100, Devin Bayer wrote:
>=20
> On 19/11/2026 14.12, Rong Zhang wrote:
> > > I don't know about query=C2=A0and notifications.
> >=20
> > Could you test if any event is emitted when you press the camera key? S=
ee
> > is_camera_toggle() in Zane's patch for the corresponding event codes.
>=20
> Is this what you are looking for?
>=20
> bpftrace -e '
>    kprobe:asus_wmi:asus_wmi_notify {
>        $obj =3D (union acpi_object *)arg0;
>        printf("_WED type=3D%u value=3D0x%016llx\n",
>               $obj->type, $obj->integer.value);
>    }'
>=20
> When I press the camera key, doesn't matter if it's disabled (LED on) or=
=20
> disabled (LED off):
>=20
> Attached 1 probe
> _WED type=3D1 value=3D0x0000000000000085
> _WED type=3D1 value=3D0x0000000000000085
>=20

This is exactly what I am looking for! Your device can take the advantage
of brightness_hw_changed though CAMERA_NEG, which proves the viability of
my proposal.

>=20
> > > The hardware key doesn't do anything if it's remapped, at least in my=
 setup.
> >=20
> > How to "remap" the "hardware key"? Isn't the LED device only "remaps" t=
he
> > status LED?
>=20
> I mean the hardware key does nothing - it doesn't control the LED or=20
> camera.=C2=A0
>=20

Got it. This is also what I expect. I misinterpreted your word as
remapping the key though hardware (i.e., EC).

Thanks,
Rong

> The desktop keyboard key is remapped in software so the desktop=20
> doesn't disable the camera when it's pressed.
>=20
> Cheers,
> Devin
