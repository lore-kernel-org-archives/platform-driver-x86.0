Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB5E942885A
	for <platform-driver-x86@vger.kernel.org>; Fri, 18 Sep 2026 20:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789764996; cv=pass; b=IohZoUR/yeJ285waSBZskhNd4H01jq0DjOh+8NlYb8xUvdd11xpbFdKLE/oqCUYA8n5WfhvaHd6YPdnzC+JCW2Y2xs5QxDTZngLVbaON8EsGfuix0g+HzzWTzjJkCxHPdVrE3nObw1RfM+YLkXu0TbZiIW98kbCqXQ/80n3uZxg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789764996; c=relaxed/simple;
	bh=ENBMa7Qt0qTZdKAAeG5Uv9lnhIsvj1EkNRJHXYbezOM=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=XT6F+ygkWFCgo0J1c2UcDn6EY2660HeyC2R1FeMcvVaoJmYKQN32NWq0mBNg2gzrU9W14Jam+7yjN4Nz51nLGpU1mP3v5NmKek4ifT6ZTlcSmugYPyM+A8li6m24QpLY/AVOxvycCpYe6YrtAlyMgpi/bOaumFmr4yWEjlHehzQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q5SPVXPl; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q5SPVXPl"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a99c5de614so1584606a12.2
        for <platform-driver-x86@vger.kernel.org>; Fri, 18 Sep 2026 13:56:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789764993; cv=none;
        d=google.com; s=arc-20260327;
        b=QgAAKsgddPxXhOpPqmHMIOruFoyDUVlPIJimiLLCFmbfBZMBSi1Fl/xc4BaTy0rAmS
         1t/kCn900dkr5Lmo0lILBwQq4FsQIvRoJ+Y04Lfk+gO9NnpbqogqTeyd1yYzW/NGXbDy
         i33SqbXTuDrzK5WvJzjp1uHNV7mELIS4QVb7cU2FC/7bZBxZPMXUErgbEKlfFJ/pOo8a
         ZX5M03t+M+CWfZxu2zJff3HcklbcHRwQuAYYoNny2/VTGwot2rc5LeG9nRfJIpQhvmSR
         /ot9hd47IyMITWko+KOhnUNXPLZWscVPqWRNL3zsa86VWMIbHtoku96hcL1ThYQsxGwd
         q0Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=RoZ5M1oD+GP9IfRhYbzqCFUJJtYRUzHYdaP+w28E9FQ=;
        fh=LAtpHtVR30q6rinFeyskR7Ff9QyURHB8q3bpp5R7hcA=;
        b=M8jBuvYGc3UoQj/Czb8WLNKGQjVYy6yOsPVA6cZAGYlS8TQ9thBsmMsLHysEdaEeMh
         hkpg+rUhr4rlcYriJOVg4ysVxl8j3qWihBE9QnsvsPCd6E26CMYsfFirmQ8dziJJI3BA
         tCltHx1SWJdBdQsXhgQtFt7ZVABScmSFd5NgoFKMtzpo8E/bfyzMSxomxO0zvyxIswTX
         6GvzowZiCFRDotemIH7Vfo7qDAWFBxcoPVPog4A8cXla2AABnZFULz+z1pFSYVL55kpV
         +mWF8Q4xmt+q5T+yjOSOy7HEeAYfn1y21pBopEB5RinO1LCrKH4DUUhCS3wFizmaQn13
         yBng==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789764993; x=1790369793; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=RoZ5M1oD+GP9IfRhYbzqCFUJJtYRUzHYdaP+w28E9FQ=;
        b=q5SPVXPlPmr7J+1z+9bDSWpD+RV9G3dzmuqVJxx35ZYmpAN8Wb9L8nQ6IQg2UsGA8i
         Xgc5wwhS+b+nHBifx2TEs2rOJ/kBixj+KftH69KKU27/42zlpMIUO0A5oBRKFmFyCkn5
         VT6Ur6XCw9n+1W4oAenwLo/nBIbWuFNjubcZQG0bJM12Oqv+9K4SbMFUnf2aP9yMDpdX
         6AT4Qm8jVjJIdsX9vJl5Ovd1gM/sPesFnT122yw0btH7A31dP2GjHEb7J7tnIKCfgFgt
         Zcn0atoyMk7pLIc3sknKU4VfH99DUfZKojEsbrN00Wmjq9NoMmlozNoumsKpyXmlGHPW
         ZWnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789764993; x=1790369793;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RoZ5M1oD+GP9IfRhYbzqCFUJJtYRUzHYdaP+w28E9FQ=;
        b=URlWB1vy7HichNbMyOilFv4adh/1tS8JzFrQ8GH3JMh4wHy7LCccEjd9z2HCpDyAnF
         Ivl+uXXmQYZCUu5eBSnoLFybPxvCQHpdNwS1tNgPeyDTIXAgWJ8QGib8B9qoxcc6EnPJ
         i/aLDehpccr8PPYcqYC9jeOvhjEF+b8XYB7I3tuyUPjejqbdeEUAyNbtUqL/g/bAk7N6
         sBbSygnbtKOnFLeRFNLb+mI+ckEH9YjjbeQD3ExPMaDKQZYWwnOaD6v4PN4Ef1uT74n+
         GQ10aHOrtShtzq/x0Ac8SlbwOoiTFH9jyT0EXSJbeXUITYIZnmVCJ/8Phagg83kDSGiH
         6WkA==
X-Gm-Message-State: AFuF++nEkqQHJUfmY5cqvG/LsAV2CEVo4X5e/hZQldkDfTOEc5IKfntC
	rRcukEa1bludQms7IKIOERIkzfWjXFwFAAeZ52TyKWjNeRGT3rv4piApxWM41VRQa3uhtZeTEMf
	vvrcICc/NOO2uPyaaEFSGeUCSfEYnJM4uVwCZ
X-Gm-Gg: AYBFou05c42UTx3d+MKetOiG+78A+/doWseGnBMBxzpvqu1HFtUFNOfCTd+aVT6QCI3
	ulzNCUV9mRg09p6cUUyr0v1TfJec1xyTZwG8426m89anVvggXQc0VcAt+mbLdLaO0dDf6GgUvhG
	1Zmc54RChMHqO9NKV3UoBJ3O8aDTMjbWcSXtuWQdgaSRomoGhijYwSAYkFK6C6xa3/a7VY36VQw
	J9hiUTEHDsNQP5b0ByguaN+NrJGFzRzJZ1Uqp4I5dutRx4wIeQWAlK0BxdrdEJsu+Nb6LLYpMn0
	Wo57vFgo7RUXqJlV430uhLFUAOxxgoEKGfrZJOA92iU0T77aeS2+w1Tzj5YYctNq6GHFKc0rMb7
	QsOWZhnTr4F77fDnKonfjkHBEasV3Rl+CdW0rqGREQL2+imWnlou5Uohs4Dgota6kUEMQ6MCH2B
	6J7esmg7YACgcsNDY2Oih2GF+//tpT48eiJvBD/SSSbY1ZQmrTEZwikFQT2oqO0w+J
X-Received: by 2002:a05:6402:21d4:b0:6a9:d0f0:69a0 with SMTP id
 4fb4d7f45d1cf-6aa579860aemr5318090a12.11.1789764992808; Fri, 18 Sep 2026
 13:56:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: =?UTF-8?Q?Marius_Lundh_H=C3=A5kestad?= <mlhaak@gmail.com>
Date: Fri, 18 Sep 2026 22:56:14 +0200
X-Gm-Features: AcwNN1WBgUsjOWc6TnUe4HrXQ2y1NrR0Q2j2vJUcbX1gjEdrVf3G1TyErBLs-vI
Message-ID: <CAFip0G2S4ScoH_CinBo2hA_ac8bNTgb-7=04bUmxiTw+OO-UWA@mail.gmail.com>
Subject: Lenovo Yoga Slim 7 14AKP10
To: platform-driver-x86@vger.kernel.org
Content-Type: multipart/mixed; boundary="000000000000a11931065bc822c5"

--000000000000a11931065bc822c5
Content-Type: multipart/alternative; boundary="000000000000a11930065bc822c3"

--000000000000a11930065bc822c3
Content-Type: text/plain; charset="UTF-8"

Hi

Long black-screen delay on resume from s2idle suspend (Lenovo Yoga Slim 7
14AKP10 / 83JY)

Claude made this report because the screen is black for 30 seconds before I
can log in after I open the lid on the laptop.

All the best,
Marius L H

--000000000000a11930065bc822c3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi<div><br></div><div>Long black-screen delay on resume fr=
om s2idle suspend (Lenovo Yoga Slim 7 14AKP10 / 83JY)<div><br></div><div>Cl=
aude made this report because the screen is black for 30 seconds before I c=
an log in after I open the lid on the laptop.</div></div><div><br></div><di=
v>All the best,</div><div>Marius L H</div><div><br></div><div><br></div></d=
iv>

--000000000000a11930065bc822c3--
--000000000000a11931065bc822c5
Content-Type: text/markdown; charset="UTF-8"; 
	name="lenovo-yoga-slim7-suspend-bug-report.md"
Content-Disposition: attachment; 
	filename="lenovo-yoga-slim7-suspend-bug-report.md"
Content-Transfer-Encoding: base64
Content-ID: <f_mu7ftyrg0>
X-Attachment-Id: f_mu7ftyrg0

IyBMb25nIGJsYWNrLXNjcmVlbiBkZWxheSBvbiByZXN1bWUgZnJvbSBzMmlkbGUgc3VzcGVuZCAo
TGVub3ZvIFlvZ2EgU2xpbSA3IDE0QUtQMTAgLyA4M0pZKQoKIyMgU3VtbWFyeQoKT24gdGhpcyBs
YXB0b3AsIGNsb3NpbmcgYW5kIHJlb3BlbmluZyB0aGUgbGlkIHJlc3VsdHMgaW4gdGhlIGtleWJv
YXJkL2JhY2tsaWdodAppbmRpY2F0b3IgbGlnaHRpbmcgdXAgaW1tZWRpYXRlbHksIGJ1dCB0aGUg
ZGlzcGxheSBzdGF5cyBibGFjayBmb3Igcm91Z2hseQozMCBzZWNvbmRzIGJlZm9yZSB0aGUgbG9j
ayBzY3JlZW4gYWN0dWFsbHkgYXBwZWFycyBhbmQgdGhlIG1hY2hpbmUgY2FuIGJlCmxvZ2dlZCBp
bnRvLiBPbmNlIHRoZSBtYWNoaW5lIGRvZXMgYmVjb21lIHJlc3BvbnNpdmUsIGV2ZXJ5dGhpbmcg
aGFwcGVucwphbG1vc3QgaW5zdGFudGx5IOKAlCBrZXJuZWwgcmVzdW1lLCBuZXR3b3JrIHJlY29u
bmVjdCwgYW5kIHRoZSBsb2NrIHNjcmVlbidzClBBTSBwcm9tcHQgYXJlIGFsbCByZWFkeSB3aXRo
aW4gYWJvdXQgMy00IHNlY29uZHMgb2YgYHN5c3RlbWQtbG9naW5kYApsb2dnaW5nICJMaWQgb3Bl
bmVkIi4gVGhpcyBtZWFucyB0aGUgfjMwcyBkZWxheSBpcyBoYXBwZW5pbmcgKmJlZm9yZSogdGhl
Ck9TLXZpc2libGUgcmVzdW1lIHBhdGggc3RhcnRzLCB3aGljaCBwb2ludHMgYXQgYSBmaXJtd2Fy
ZS9FQy1sZXZlbCBpc3N1ZQpyYXRoZXIgdGhhbiBhbnl0aGluZyBpbiB0aGUga2VybmVsJ3Mgc3Vz
cGVuZC9yZXN1bWUgaGFuZGxpbmcgaXRzZWxmLgoKVHdvIGZpcm13YXJlLW9yaWdpbmF0ZWQgQUNQ
SSBwcm9ibGVtcyBzaG93IHVwIGluIHRoZSBrZXJuZWwgbG9nIG9uIGV2ZXJ5CnN1c3BlbmQvcmVz
dW1lIGN5Y2xlIGFuZCBhcmUgdGhlIGxlYWRpbmcgc3VzcGVjdHM6CgoxLiBBIG1pc3NpbmcgRUMg
c3ltYm9sIHJlZmVyZW5jZWQgYnkgdGhlIGBfUEVQLl9EU01gIG1ldGhvZCAoUG93ZXIgRW5naW5l
CiAgIFBsdWdpbiksIGNhdXNpbmcgdGhhdCBtZXRob2QgdG8gYWJvcnQgb24gZXZlcnkgc2luZ2xl
IHJlc3VtZToKCiAgIGBgYAogICBBQ1BJIEJJT1MgRXJyb3IgKGJ1Zyk6IENvdWxkIG5vdCByZXNv
bHZlIHN5bWJvbCBbXF9TQi5QQ0kwLkxQQzAuRUMwLk9TRkddLCBBRV9OT1RfRk9VTkQgKDIwMjYw
NDA4L3BzYXJncy0zNjUpCiAgIEFDUEkgRXJyb3I6IEFib3J0aW5nIG1ldGhvZCBcX1NCLlBFUC5f
RFNNIGR1ZSB0byBwcmV2aW91cyBlcnJvciAoQUVfTk9UX0ZPVU5EKSAoMjAyNjA0MDgvcHNwYXJz
ZS01NDMpCiAgIGBgYAoKMi4gVGhlIGtlcm5lbCdzIG93biBBQ1BJIGJ1dHRvbiBkcml2ZXIgZmxh
Z3MgdGhlIGZpcm13YXJlJ3MgbGlkLXN0YXRlCiAgIHJlcG9ydGluZyBhcyBidWdneToKCiAgIGBg
YAogICBBQ1BJOiBidXR0b246IFtGaXJtd2FyZSBCdWddOiBVbmV4cGVjdGVkIGxpZCBzdGF0ZSBy
ZXBvcnRlZCBieSBmaXJtd2FyZQogICBgYGAKCiMjIFN5c3RlbSBpbmZvcm1hdGlvbgoKLSBNb2Rl
bDogTGVub3ZvIFlvZ2EgU2xpbSA3IDE0QUtQMTAgKHN5c3RlbSB0eXBlIGA4M0pZYCkKLSBCb2Fy
ZDogYExOVk5CMTYxMjE2YCwgU0tVIGBMRU5PVk9fTVRfODNKWV9CVV9pZGVhX0ZNX1lvZ2EgU2xp
bSA3IDE0QUtQMTBgCi0gQ1BVOiBBTUQgUnl6ZW4gQUkgNyAzNTAgdy8gUmFkZW9uIDg2ME0gKFN0
cml4IFBvaW50KQotIEJJT1M6IFFUQ04yMFdXLCBkYXRlZCAyMDI0LTAxLTE2IChjb25maXJtZWQg
dmlhIGBmd3VwZG1nciBnZXQtdXBkYXRlc2AgdG8KICBiZSB0aGUgbGF0ZXN0IHZlcnNpb24gY3Vy
cmVudGx5IHB1Ymxpc2hlZCB0byBMVkZTIGZvciB0aGlzIG1vZGVsIOKAlCBubwogIGZpcm13YXJl
IHVwZGF0ZSBhdmFpbGFibGUgdG8gdGVzdCBhZ2FpbnN0KQotIEtlcm5lbDogNy4yLjUtMy1vbWFy
Y2h5IChBcmNoL09tYXJjaHkgYnVpbGQ7IHVwc3RyZWFtLWJhc2VkLCBgYW1kX3BtY2AKICBkcml2
ZXIgcHJlc2VudCBhbmQgbG9hZGVkKQotIFNsZWVwIG1vZGU6IG9ubHkgYHMyaWRsZWAgaXMgb2Zm
ZXJlZCB2aWEgYC9zeXMvcG93ZXIvbWVtX3NsZWVwYCAobm8KICBgZGVlcGAvUzMgb3B0aW9uKQoK
IyMgV2hhdCBJIGFscmVhZHkgcnVsZWQgb3V0CgotICoqTm90IGEga2VybmVsIHJlc3VtZSBzbG93
bmVzcyBpc3N1ZS4qKiBgam91cm5hbGN0bCAta2AgdGltZXN0YW1wcyBzaG93CiAgYFBNOiBzdXNw
ZW5kIGV4aXRgIGFuZCB0aGUgbG9jayBzY3JlZW4ncyBQQU0gcHJvbXB0IGJlY29taW5nIHJlYWR5
IGFyZQogIG9ubHkgfjMtNCBzZWNvbmRzIGFwYXJ0LCBjb25zaXN0ZW50bHksIGFjcm9zcyA3KyBz
dXNwZW5kL3Jlc3VtZSBjeWNsZXMKICBsb2dnZWQgdG9kYXkuCi0gKipOb3QgdGhlIGtub3duIGBh
bWRfcG1jYCBFQy1ib29ra2VlcGluZyBidWcqKiAodGhlIG9uZSBmaXhlZCBieSB0aGUKICByZWNl
bnQgdXBzdHJlYW0gYG5lZWRfc3VzcGVuZF9kZWxheWAgLyBgcXVpcmtfczJpZGxlX25lZWRfc3Vz
cGVuZF9kZWxheWAKICBETUktcXVpcmsgcGF0Y2ggc2VyaWVzIGZvciBvdGhlciBMZW5vdm8gQU1E
IGxhcHRvcHMpLiBUaGF0IHF1aXJrIHRhYmxlCiAgKHZpc2libGUgdmlhIGBzdHJpbmdzYCBvbiBg
YW1kLXBtYy5rb2ApIGN1cnJlbnRseSBvbmx5IGxpc3RzIFplbjMvWmVuMysKICBJZGVhUGFkL1lv
Z2EgbW9kZWxzIChlLmcuIGA4MllUYCwgYDgyVkZgLCBgMjFBMGAsIGBZb2dhIDYgMTNBTEM2YCkg
4oCUIG5vdAogIGA4M0pZYC4gSSB0ZXN0ZWQgdGhlIHNhbWUgdW5kZXJseWluZyB3b3JrYXJvdW5k
IG1hbnVhbGx5IHZpYSBhCiAgYC9ldGMvc3lzdGVtZC9zeXN0ZW0tc2xlZXAvYCBob29rIHRoYXQg
c2xlZXBzIDIuNXMgYmVmb3JlIHN1c3BlbmQgZW50cnksCiAgYW5kIGl0IG1hZGUgbm8gZGlmZmVy
ZW5jZSB0byB0aGUgcmVzdW1lIGRlbGF5LCBzbyB0aGlzIGxvb2tzIGxpa2UgYQogIGRpZmZlcmVu
dCBidWcgdGhhbiB0aGUgb25lIHRoYXQgcXVpcmsgYWRkcmVzc2VzLCBldmVuIHRob3VnaCBib3Ro
CiAgaW52b2x2ZSBicm9rZW4gRUMgQUNQSSBoYW5kbGluZyBvbiBMZW5vdm8gZmlybXdhcmUuCi0g
KipOb3QgYSBXaUZpL25ldHdvcmsgcmVjb25uZWN0IGRlbGF5Kiog4oCUIHJlY29ubmVjdGlvbiBj
b21wbGV0ZXMgd2l0aGluCiAgdGhlIHNhbWUgZmV3IHNlY29uZHMgYXMgZXZlcnl0aGluZyBlbHNl
LgotICoqTm90IGEgZmluZ2VycHJpbnQgcmVhZGVyIC8gUEFNIHNsb3duZXNzKiog4oCUIG5vIGBm
cHJpbnRkYCBpcyBldmVuCiAgaW5zdGFsbGVkL3VzZWQgb24gdGhpcyBzeXN0ZW0uCgojIyBXaGF0
IEkgY291bGQgbm90IHZlcmlmeSBmcm9tIHVzZXJzcGFjZQoKLSBXaGV0aGVyIHRoZSBDUFUgcGFj
a2FnZSBpcyBhY3R1YWxseSBzdGF5aW5nIGluIGRlZXAgc2xlZXAgZm9yIHRoZSBmdWxsCiAgfjMw
cyB0aGUgdXNlciBvYnNlcnZlcyBhbmQgaXMgb25seSB3b2tlbiBieSBhIGZhbGxiYWNrL3Blcmlv
ZGljIHNvdXJjZQogIHJhdGhlciB0aGFuIHRoZSBsaWQgR1BJTyBpbnRlcnJ1cHQgZGlyZWN0bHkg
KHdvdWxkIG5lZWQgYGFjcGkuZGVidWdfbGV2ZWxgCiAgYm9vdCB0cmFjaW5nIG9yIGBhbWRfczJp
ZGxlLnB5YC1zdHlsZSBoYXJkd2FyZSBzbGVlcCByZXNpZGVuY3kgYW5hbHlzaXMKICB3aXRoIHJv
b3QvZnRyYWNlIGFjY2Vzcywgd2hpY2ggSSBkaWRuJ3QgaGF2ZSBpbiB0aGlzIHNlc3Npb24pLgot
IFdoZXRoZXIgYC9wcm9jL2FjcGkvd2FrZXVwYCBsYWNraW5nIGEgZGlzdGluY3QgYExJRGAvYExJ
RDBgIGVudHJ5IGlzCiAgbWVhbmluZ2Z1bCBoZXJlIG9yIGp1c3QgZXhwZWN0ZWQvbm9ybWFsIGZv
ciBhIHB1cmUgczJpZGxlLW9ubHkgcGxhdGZvcm0KICB0aGF0IHJlcG9ydHMgd2FrZSBzb3VyY2Vz
IHRocm91Z2ggYGFtZF9ncGlvYCBBQ1BJOkV2ZW50IElSUXMgaW5zdGVhZC4KCiMjIFN0ZXBzIHRv
IHJlcHJvZHVjZQoKMS4gT24gYmF0dGVyeSBvciBBQywgd2l0aCBXaUZpIGNvbm5lY3RlZCwgY2xv
c2UgdGhlIGxhcHRvcCBsaWQuCjIuIFdhaXQgYXQgbGVhc3Qgc2V2ZXJhbCBzZWNvbmRzIChyZXBy
b2R1Y2VzIGV2ZW4gYWZ0ZXIgdmVyeSBzaG9ydAogICBjbG9zdXJlcywgZS5nLiB+MSBtaW51dGUp
LgozLiBPcGVuIHRoZSBsaWQuCjQuIE9ic2VydmU6IGtleWJvYXJkL2luZGljYXRvciBsaWdodCB0
dXJucyBvbiBpbW1lZGlhdGVseSwgYnV0IHRoZSBzY3JlZW4KICAgc3RheXMgYmxhY2sgZm9yIH4z
MCBzZWNvbmRzIGJlZm9yZSB0aGUgbG9jayBzY3JlZW4gYXBwZWFycy4KCiMjIFJlbGV2YW50IGxv
ZyBleGNlcnB0IChvbmUgZnVsbCBjeWNsZSkKCmBgYApTZXAgMTggMjI6MzM6MDggb21hcmNoeSBz
eXN0ZW1kLWxvZ2luZFsxMDIxXTogTGlkIGNsb3NlZC4KU2VwIDE4IDIyOjMzOjA5IG9tYXJjaHkg
a2VybmVsOiBQTTogc3VzcGVuZCBlbnRyeSAoczJpZGxlKQpTZXAgMTggMjI6MzM6MDkgb21hcmNo
eSBrZXJuZWw6IEZpbGVzeXN0ZW1zIHN5bmM6IDAuMDAzIHNlY29uZHMKU2VwIDE4IDIyOjM0OjA1
IG9tYXJjaHkga2VybmVsOiBGcmVlemluZyB1c2VyIHNwYWNlIHByb2Nlc3NlcwpTZXAgMTggMjI6
MzQ6MDUgb21hcmNoeSBzeXN0ZW1kLWxvZ2luZFsxMDIxXTogTGlkIG9wZW5lZC4KLi4uClNlcCAx
OCAyMjozNDowNSBvbWFyY2h5IGtlcm5lbDogQUNQSSBCSU9TIEVycm9yIChidWcpOiBDb3VsZCBu
b3QgcmVzb2x2ZSBzeW1ib2wgW1xfU0IuUENJMC5MUEMwLkVDMC5PU0ZHXSwgQUVfTk9UX0ZPVU5E
ICgyMDI2MDQwOC9wc2FyZ3MtMzY1KQpTZXAgMTggMjI6MzQ6MDUgb21hcmNoeSBrZXJuZWw6IEFD
UEkgRXJyb3I6IEFib3J0aW5nIG1ldGhvZCBcX1NCLlBFUC5fRFNNIGR1ZSB0byBwcmV2aW91cyBl
cnJvciAoQUVfTk9UX0ZPVU5EKSAoMjAyNjA0MDgvcHNwYXJzZS01NDMpCi4uLgpTZXAgMTggMjI6
MzQ6MDUgb21hcmNoeSBrZXJuZWw6IGFtZGdwdSAwMDAwOmMxOjAwLjA6IFNNVSBpcyByZXN1bWVk
IHN1Y2Nlc3NmdWxseSEKU2VwIDE4IDIyOjM0OjA1IG9tYXJjaHkga2VybmVsOiBQTTogc3VzcGVu
ZCBleGl0Ci4uLgpTZXAgMTggMjI6MzQ6MDkgb21hcmNoeSBvbWFyY2h5LXNoZWxsWzMzNzk3XTog
cXVpY2tzaGVsbC5zZXJ2aWNlLnBhbS5zdWJwcm9jZXNzOiBXYWl0aW5nIGZvciBwYXJlbnQgY29u
ZmlybWF0aW9uLi4uClNlcCAxOCAyMjozNDowOSBvbWFyY2h5IG9tYXJjaHktc2hlbGxbMzM3OTdd
OiBxdWlja3NoZWxsLnNlcnZpY2UucGFtLnN1YnByb2Nlc3M6IEdvdCByZXNwb25zZSAuLi4gQXV0
aGVudGljYXRlZCBzdWNjZXNzZnVsbHkuCmBgYAoKTm90ZSB0aGUgfjU2LXNlY29uZCBnYXAgYmV0
d2VlbiAiRmlsZXN5c3RlbXMgc3luYyIgKGdvaW5nIHRvIHNsZWVwKSBhbmQKIkZyZWV6aW5nIHVz
ZXIgc3BhY2UgcHJvY2Vzc2VzIiAod2FraW5nIHVwKSByZWZsZWN0cyB0aGUgYWN0dWFsIGxpZC1j
bG9zZWQKZHVyYXRpb24gaW4gdGhpcyB0ZXN0LiBXaGF0IG1hdHRlcnMgaXMgdGhhdCBldmVyeXRo
aW5nIGZyb20gIkxpZCBvcGVuZWQiCm9ud2FyZCAoa2VybmVsIHJlc3VtZSwgR1BVIHJlc3VtZSwg
bmV0d29yaywgbG9jayBzY3JlZW4pIGNvbXBsZXRlcyBpbgp+NCBzZWNvbmRzIOKAlCBidXQgdGhl
IHVzZXIgdmlzdWFsbHkgb2JzZXJ2ZXMgfjMwIHNlY29uZHMgb2YgYmxhY2sgc2NyZWVuCnN0YXJ0
aW5nIGZyb20gd2hlbiB0aGV5IHBoeXNpY2FsbHkgb3BlbiB0aGUgbGlkLCB3aGljaCBpcyAqYmVm
b3JlKiBhbnkgb2YKdGhlc2UgbG9nIGxpbmVzIGFwcGVhci4gVGhpcyBnYXAgaXMgbm90IGFjY291
bnRlZCBmb3IgYnkgYW55dGhpbmcgdmlzaWJsZQppbiB0aGUga2VybmVsIG9yIHVzZXJzcGFjZSBs
b2dzLgoKIyMgUXVlc3Rpb24gZm9yIG1haW50YWluZXJzCgpHaXZlbiB0aGUgdmVyeSBzaW1pbGFy
LCBjdXJyZW50bHktYWN0aXZlIGBhbWRfcG1jYCBgbmVlZF9zdXNwZW5kX2RlbGF5YApxdWlyayB3
b3JrIGZvciBvdGhlciBMZW5vdm8gQU1EIGxhcHRvcHMgd2l0aCBicm9rZW4gRUMgQUNQSSB0YWJs
ZXMsIGlzIHRoaXMKYSByZWxhdGVkLWJ1dC1kaXN0aW5jdCBmaXJtd2FyZSBidWcgdGhhdCB3b3Vs
ZCBuZWVkIGl0cyBvd24gaW52ZXN0aWdhdGlvbgooZS5nLiBhY3R1YWwgd2FrZS1zb3VyY2UvR1BF
IHJvdXRpbmcgZm9yIHRoZSBsaWQgc3dpdGNoLCByYXRoZXIgdGhhbgpwcmUtc3VzcGVuZCBFQyB0
aW1pbmcpPyBIYXBweSB0byBnYXRoZXIgYGFjcGkuZGVidWdfbGV2ZWw9MHhmZmZmZmZmZmAgYm9v
dAp0cmFjZXMsIGBhbWRfczJpZGxlLnB5YCBvdXRwdXQsIG9yIGEgRFNEVC9TU0RUIGR1bXAgaWYg
dGhhdCB3b3VsZCBoZWxwCmRpYWdub3NlIGZ1cnRoZXIuCg==
--000000000000a11931065bc822c5--
