Received: from sender4-of-o54.zoho.com (sender4-of-o54.zoho.com [136.143.188.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 570951E51F6
	for <platform-driver-x86@vger.kernel.org>; Tue, 16 Sep 2025 06:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758005712; cv=pass; b=li6+KrTnj1n4MU21SQ7+tXpwOn+STCMXU8C0L4j4glgkdO0YBw3bxHOaWEAr1+O53jy9F+VpT2ZriZ1E06J7MZ213ByZC2WQPuFOjXR7ma28B7Df+PagICf5MFHtytUnRBNxlI3siiWE8DDtv0Rh7Z/DmiNFxt9xY8m+4P3niF0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758005712; c=relaxed/simple;
	bh=J3Twh5cYIkwJzb0gfGr9A1QpxCLjFlw+sYRWImnFWBU=;
	h=From:In-Reply-To:Content-Type:References:Date:Cc:To:MIME-Version:
	 Message-ID:Subject; b=NiB9KMNLilfl44yu+zpjISebwo7U4n4YT+nDFkznEL+hLcXopm4rksYtIRUi4M3dEt+5Xy5nSFJODAY1yw76U1t9ckp59LD+fjGmgVh3SZPJbo/KyuPmz7Vz8ebMJIZZo/HFDk/iPufyRkxvojJFVvAXJMESHDZEDjAKym0sKuQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chandra.net; spf=pass smtp.mailfrom=chandra.net; dkim=pass (1024-bit key) header.d=chandra.net header.i=rahul@chandra.net header.b=Ob8b6H+F; dkim=pass (2048-bit key) header.d=chandra.net header.i=@chandra.net header.b=CSSWWnZp; arc=pass smtp.client-ip=136.143.188.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chandra.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chandra.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chandra.net header.i=rahul@chandra.net header.b="Ob8b6H+F";
	dkim=pass (2048-bit key) header.d=chandra.net header.i=@chandra.net header.b="CSSWWnZp"
ARC-Seal: i=1; a=rsa-sha256; t=1758005696; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=KyxF00woVCQHJbKwnGB1Bt9OYPwTDKSpVi05GU6Lnec7P4OcqrXA7eHmqdAqh+G7rB9RRzan1sRMWeID3vsCrVWM0rcwDM3B7FBcopWmYIhwTyD1/noQNnomHo19gQWWsGUyKQ3oyFy35utwXLpEoYHP6aW13Ao2q11JfBpG96k=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1758005696; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=/YE9Krkfk14buZxf09xfeYUG/IekFSq4TIk40pOHumw=; 
	b=GrlDVGuDO8NcX7U64eM8kN7XDVMGCheXoo5RwuE+hqtsCRgNQKoprGjnZXnAvevXCKxUh0AK7UfhWL1S1UFUClXI0micgRs58t4VXtVQN+GBe7lz+rT09wiZBIwb3d2pNpuruCMGst2EGeEAEjnhxgFm7mhMrsA6bU8fXHmsTTo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=chandra.net;
	spf=pass  smtp.mailfrom=rahul@chandra.net;
	dmarc=pass header.from=<rahul@chandra.net>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1758005696;
	s=zmail; d=chandra.net; i=rahul@chandra.net;
	h=From:From:In-Reply-To:Content-Type:References:Date:Date:Cc:Cc:To:To:MIME-Version:Message-ID:Subject:Subject:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=/YE9Krkfk14buZxf09xfeYUG/IekFSq4TIk40pOHumw=;
	b=Ob8b6H+FbEWIM9aIyDV5XOmKgqzztyQlpaDBnj+WjJU3pdV8SVjYihnaxfRqlUW7
	8r0kb0roQHqF42YMgHlp1bB7yraG31HIzOjWJ87z48TPvjqt/Q+MUtpoG0MdKYJ+Cpf
	6k5d9IK/NfylWGXph5yv1zcNcJQEnZWx91dp2Epo=
Received: by mx.zohomail.com with SMTPS id 1758005695115584.9594369858825;
	Mon, 15 Sep 2025 23:54:55 -0700 (PDT)
Received: from sogo.mynetworksettings.com (pool-173-70-162-2.nwrknj.fios.verizon.net [173.70.162.2])
	by mailserver.projecteclipse.org (Postfix) with ESMTPSA id 6CDE8ECBED;
	Tue, 16 Sep 2025 06:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=chandra.net;
	s=default; t=1758005693;
	bh=J3Twh5cYIkwJzb0gfGr9A1QpxCLjFlw+sYRWImnFWBU=;
	h=From:In-Reply-To:References:Date:Cc:To:Subject:From;
	b=CSSWWnZpNLhVW4gUAXmM2AGv+HB7MKUf91vJlVgc/Ei1ttGPyjjEDAr+SVrI1oHr5
	 HkoPEXG5c5R+cVkT5d9SgPqJ6TuMerMRFgLnKNEGMRUDfa6CxOrTwUWVB0sdDDEiov
	 VU/UYbiEHZ6oGGr23R0nx3TOuoy7fCiWqrzfYauPnnvorGFN9mKXZOcbS8d1h1AuzN
	 s8f3XZb1gcKKK5KSE3iKsgrZMgxEtdqEuhqd3U78apAXeqFn6gx6k/Gm91waIZCU+o
	 t3HkBPVPfvLjPPJVEKM1b4ENaMD851FBtqZ+ChVE7FkSsH+T9D5JjdGrQObxTM14w/
	 4viKVHjKI275Q==
From: "Rahul Chandra" <rahul@chandra.net>
In-Reply-To:  <CAGwozwFaB9YMKqc1tbmRvjjAZLZRZJKKEjYFDH38EbdeBRvWmA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
X-Forward: 173.70.162.2, 192.168.1.147
References: <1e1-68c90780-93-13ea166@216760021>  <CAGwozwFaB9YMKqc1tbmRvjjAZLZRZJKKEjYFDH38EbdeBRvWmA@mail.gmail.com>
Date: Tue, 16 Sep 2025 02:54:53 -0400
Cc: platform-driver-x86@vger.kernel.org, ilpo.jarvinen@linux.intel.com, mathieu@fenniak.net, corentin.chary@gmail.com, luke@ljones.dev
To: "Antheas Kapenekakis" <lkml@antheas.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <1e1-68c90980-99-13ea166@216761407>
Subject: =?utf-8?q?Re=3A?= [PATCH v2 1/2] =?utf-8?q?platform/x86=3A?=
 =?utf-8?q?_asus-wmi=3A?= Remove extra keys from 
 =?utf-8?q?ignore=5Fkey=5Fwlan?= quirk
User-Agent: SOGoMail 5.12.1
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External

On Tuesday, September 16, 2025 02:50 EDT, Antheas Kapenekakis <lkml@ant=
heas.dev> wrote:

> On Tue, 16 Sept 2025 at 08:46, Rahul Chandra <rahul@chandra.net> wrot=
e:
> >
> > Added some cc's
> >
> > *Note I have a UX8406CA (the 2025 Arrowlake model, I assume it is t=
he same on the MA)
>=20
> I must have mistakenly thought that the important code on both device=
s
> is 0x5F. Perhaps on the duo is 0x5D instead or it emits events on
> both. Can you verify which codes are used on the Duo?
>=20
weird,
scankey -s reports
0xe0 0x73  0xe0 0xf3, the 0xe0 is for the extended scancode set but I'm=
 confused on the other 2 codes. the WLAN quirk definitely worked before=
 (I submitted the patch for it for the CA)


--=20
Rahul

