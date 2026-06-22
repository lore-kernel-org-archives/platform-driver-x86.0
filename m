Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F0F349B1F;
	Mon, 22 Jun 2026 19:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782157176; cv=none; b=UxdRXrdUTsNVxxvMyh9wMTvtOONgoWv1NbWSvRHU8dnxBAer3ReYvCmXwK9TvUk/527Q4KU5OpPTbB7YySpJlhfKCWzKRtHJ7yjWxIWWGUyQTCzwuV0Wg0f6bdqqZBtgxCi6c2Eyy+wKrIxE4OxBOQMsxfjhi6ckxiHbWDLBY1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782157176; c=relaxed/simple;
	bh=mw543iyKfk+r8uHK7Azax8j573O6uTvX+0TVK2b04To=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=RJqHaigHEgEYCZdO+HYkH9sRv9F7URz29uyxrpOiH/zBV8IITdjZuDcVfNPJ80y1d01CeLe6cFRaWVBmXBsRSJNFUHvNhnNqn69y6X3+gQGp7gaPf1JWspv6PM4hXmcL4Lasbxjd0D+/5O8D9atvvBF1r8r29PfwDaNw4PwbiU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=Wy9jFtOF; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="Wy9jFtOF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1782157169; x=1782761969; i=w_armin@gmx.de;
	bh=jOVGSod8/iQpN4eUPsV4B5rqDt93+rR3BLKiR3IWqlQ=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Wy9jFtOF8QS4Rkk+1XJRBJ8RzW8zAhxHllt2+P4yVX+RUlW5i+sOPyKlPdBiVowI
	 7gHqJuk8lKRYKJGHU7nGTeGuw12Ed6TWshK9YVEv9ZafZDKoN+g0gfJ0oPd0m6EDy
	 ScRLr5WKxwqNpzwM1T2ZuA2gOFTGU+5xVi1j8mtRNNlXvHd0H+o+C0wUQs3ME3q6U
	 hWXEuYIiSmr3FAklNrJG0pNV6Xw5eJjUkc6CP86zCtVlez864ug/du+hpdSv4yXHG
	 Kef2Fy8q3eYpWG0j0Zdfr/hE/CC80QLGRE1ldwuUeD2m5mG50gSRDGydJw09YlGsd
	 Kj/gLNoAkK/c/gUbOA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MrQIv-1wz1sM0XPb-00pRBW; Mon, 22
 Jun 2026 21:39:29 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: matan@svgalib.org
Cc: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] platform/x86: lg-laptop: Improve support for modern devices
Date: Mon, 22 Jun 2026 21:39:09 +0200
Message-Id: <20260622193914.116999-1-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:0R7VoN0Es32JIOG9naTflH9i/CLpijZorflTB6GXnQjmFO2/Bq6
 00z/EQnIznv0WixdLkI7EhT+Hxb9dygAQ2a96tLaL2mYJDlh4AFLHrj6ve65u7fyBkq07LO
 SSKwUMLkGX7pibTf0ZCZtPgoy1FCQ4VXDX8Ypn9SwicJd0jwwHkqjeN5NmFfgwjeuBGMamT
 hojRs8GGINz8Rb/FtWpXw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:bFK6kHb4aPg=;ZYjdOgOM3U5OqTlODixyNGKMtks
 ey19H/S3LEGL1hBrYaWYDYP7BHBkv9Y097YqtKG5/iDQkxUckm25wfFq9OCrVPk2QU/0WgnUE
 VyU5BLwBNluCtRQ7TNb12cbvT+MwXoAI402n4j3eM3OL4Fboa0sGK6usNYDfxsYOC5xc6SawU
 EskjHZ7TTy+3MNc/yVnxBnNo0LfntfiSLx6gML6Zn7uXaMmaTk82psBJdZQwHJoSjbYKTdy/p
 XbR21XbiLs+TgPzqhGBD9njQKM1Tkekh9FVlA3wJtuRs1rlo3Zgu3ybF4hfBDA58met7h4Kd/
 3aaiv1nfZYzX8e7k9yhCGw9w8YfXQiJc1rS8RHxSSI5GYsmhPPaBOYgG9gcGBmV/e0ouWoRpv
 y1k0jf8ag3VLy2uQjWM0GdeRN0nRa0arkOBUOxdwA0UilI030eonQE2LgPX9EHuz6dkbk2g2V
 GcXc5IR2HbLVp7URp4ukqR30DrpLDcpM8054k12T3r24RbISQysatEdVnPHRey3YI29txkreF
 Lxm8JQcd901u86FyLP63EgRI6itejXB37nYMCliMdhGb729mK76Lh3rwQF3/APXRCJ5d48iNo
 fkqqAxb3sOcCwYTC/hBHxJt8cHUonQi1S0ujJaqAzzIA2OeI8diGJ9k2Iw9p9ykAkjyMz96ZY
 NgwImPXZwHg+TZVsKb75nyD6AckOCwn6o0LwtSgZA0/njf9DyFMkZFjDcNxoKe7CKNMueW8ra
 rLStlt0iKstSP5QrSy4X1ary9UkQb9usDCcHwMXjm2rcU9jLsKpJOik5AW98TmaAtsHTffmky
 UvBNtjL/5ysF/012gsrlB+cj9SsHCxEm2+uoZt6DCwGt1+9ZsByeZwejAtSx/IQBesRCAzYQY
 I/wE5kyIhTa7ggxa/x03OOq5jhN5iCKmdEccPExicVnn/u+NTNp3m0faYkZ2A0IE7iMdGox1m
 8ncBf2LA3Pno0qfE3z7LaE7DQKko5g8UgUa/At1n448fgJ4OjIbGSBcty/S3KPFvxZyXqoA88
 kUzdW6XLcT0L8GrSloBAmprBu1b2/NIkJgSYf4AKXuOP8iD1rHWD7veGuIioh5AcO/NaaRmNJ
 wDGRTuR+RcoG6CfeWdpA8F0iMHnGAflNqo15NS+AK9Atg7R3QhtAXqyLggtEWK9KdilVHY/In
 H3DzgL/0hXM0jQRB9+E5iP8lq6H7StqoRiqIXY8opVL6PYT2FgD+pZbK6/E+1R9NWyEUjLZUB
 tVJC5t7Z8iPDPpQqDjoJ3AlJtgPNtzT1NaygSugSnblXniShSadOwJ1UOkhZyGKB5n0bIs76g
 pzbCbOVMaDjQ4Bgjyq2uKttaE9FvqY8unM7BA0gXDcQZdpV95bWMiowDBtHdHsLkKgbRUz676
 aIN42b05NnTukAIbcMxKqQHXTf78GiC1l1pQs2oXkgCKfL8DwHMWMu0kfTTV8/Ht/gGjXNT3l
 jkUqAADlpHUtYYLtSHhE5MakYmIjCvGL+X/McsvFVlW7CBYDRUlWY69Ndw8R3dlYgBJHOasXv
 hPhUFXuoKlus2QMtsGfMuCYPNuEqp75owRaPUNfWzM2bYocH53g3MoPncV58c2kiHzD+/Nwl3
 WiqKo5PrQ56Pza7pxTg3ysKI+AX2bYvaGSiLsmN/aq6R37/U+OEEvVFsJ4g9SLsdr7fH05xwD
 UJuBQz+zYHcUUJQC1gKa9gaOX6mZDFFC6u4YzElT0lldMkbbe5/hJ89RzBsrxldvEhe4JjASi
 W937tVxhLnR5FWZvgNjDEgHGMVCv6U+G69zzxGI2W27hym31bCx0qXICJ+G6rW3JKvAlSkr/p
 YaR058LppN4a5FpPcGnDPPcHihL+Fw916N7psvWS5WHP0Y7bbYE1y11RqMp3n70AE5CcqMl5c
 LlQ8ux3ajN2XF80VrHrpPblX3ehYTAhqYONXMxzSsvPBwOSpBnGY7ZnBIZ/GqxE8UqC2OM1Sz
 bEgIbt7Z70DEZCAbVzvpZK1PdLCGZ7mD1xWUvEzMgmfyUmfZCeo5dSMznUiXMVDygqPNceaDG
 shXHOrG4zoe1wdjP1Y1fRvul9e9q/DPBNWg2QoYHI66ft+v1MnIQ9ImIoUA7+aqGGI3p7pky6
 3QnuU1WwBMOQmUC6HOnFOh7w5YhtLEVZLhk1avr0MVj9zG9Swu5FJxzjDKw50RjsQrGg/Gae9
 Ww03lOZPfZBCICPFSY/CeAz5uwR26h8kZlm5/eOb35IE2cY7QMaaLAP2JyapMP38sVxPo1yQA
 r3XzRAd5BGvmh+fDHtr1M+J82KS85rf6UN+JLURBRs5ImP1m4Gu3pw6sPxkwgwOVdrWUkA97w
 qDZxphgwBTtR4F9rJn8t3spsUf5oGEbmF4F1E/hzNw3DGfmNBqlyqfmzA0oEZopEI572HjaDq
 V+sZoiaNMDrSatGakDtTyXOlSwecgzX93qW5/NT7iplCee9zdZy3NAlj7xe4QAJaGig7hq+6M
 ov8N3r6XXonh+Ksd6vSW071IS5HaZ+9UNba/sjZtcoSKRvIKb5BKy1jAyvWLA5AUivJDGgxR7
 mWOd4uh9yUNHKhH3iFC7TgxqPQ8MteehXgT14p9wAWPBv3Q4w3twLE3iFDA8UtTzmNtmH3kKq
 glFKb4bpfyGioaIw+R0qRmZVQaXPA2kRzY/l2cF6Drc09rJbUp6e+NYYSLQsgEX+0PSjexNZI
 zjXjU1aHgTMSfgbC5+yh/5DnsaH8YaMyrUSZ1IAvL6Z0KPeL61jLpIFkRuQ1ASUKf4Vejkcmd
 U3DB6IJcwOfEawf4X0PGQDu5nXXU16j8rmJjXzO+Cemh77LrVTimi2cPfcxqAg6hqGmRhVzcx
 YxplmWF7iXQ2ElKPGiuE14aA7MgldzjHPN74eOBbs7UhuQEHYhnvn5+1IiRMONgUd68LN2+MW
 +oY8qofXSjgSKhteVU1nMTqSpLYj8F6jN5GZDh4ZOFcTI8wSKnnW91iDKmgaYDLrhSHgZol/7
 TucYpf3G4lQqvGgR4+V8EnCqzVPW8lnQcg88137k69vmdIsr6oA6CEaN4p0F+r9Xl7AeufTFp
 zSrSFFNKpgGcfEV7KH2L1I8/yDGMpA51DU+ajbCE4NwTVIvH46+adoY3Cae6+r+V52KLukR93
 IAefhk1LI7b07zVvQHQaMT06aHj8iiNf/lZgqaTOAlTqA4N0HLWfz+1pSX9F9TRUF2qAynbXF
 5vOjnbgzRKbmio+wG2DZDxfJHrz41ifc9dBNGqnvIGZ3/3gIYAVZvmS0cy3/V4MYD8vliUXKo
 00quG7cobcK3V7ObNb/VEAXcHbbb35eIZTsrGq3QbLGJzYCRFpokZ4g7hmooJdjrY/vIRerR7
 WVmJaW4v0p3IM/SJQvpnU58ykF4ZGbABh4wsbGeT1Hgv0Z0fLeusKm6MqIyD9hPi/GQd+EFLJ
 KIqMcjHK5QAwcFcNvC6BMdiF8WQuFFhvPNxaRZdHAO+JeRCGwrfitWKIXa8I7STfcEFs1dAjc
 d1RL8mTFCklMFH+1QOf3TVNh88mmdwH6FgleAfxGL4DQQYRvoesJZRmemAP9MRIQN3hESMNL6
 aUhZtcvaYH2i8Cbzl59+bswokS2qL9Mq5JTyx8AzLxB5W73fskX17MxbAPNBmBmgaaUcsImb1
 RzI9mbao5c0Q5YEgxF5b9OLImykRkeA2OMUjuD1Hz/VUAC/rrLpS0rTi5QuJJ3VNkaPIwIBhy
 +csIZrbjHgndZGEFp8amVIqM25tq/DnrHxyIHDVHei8Nyq0g5uGJ87A8M62RE+RvIP2ypWSIX
 OECldkRAdMiuyjERI8oiHuQHaNYc/EfrcICWadF0xVBcHmQMeyWeii8NHDQJ4uPu6x5cQakxt
 3tMj2KzL4ZMZRB3Ja5Z02CACCu9bB7/0VuOMbu0Lsjq0oc0WhxHVBtfOpMTNA9r8nHzNgVo3S
 ZfmLdAtGyX+nu/BuMWDr1PXLFWlRFaQIsjKiQ0mvLSBZmkctKZ3JRzoJGGLMjT3YS0ArTa5Gy
 GfioUU5xDgtiBjoRhwa4PkwlHq+VYCgW1bO7aJ+w7tvkNJb6u6fc7o4Y5jzEpYAomYYpwda5s
 x0lI/pCBKJWvgE2y6fazG9hOVQ78brErA5V40Y18do+OzkR3b6MY/fpMZdiUxYlC0UXOtuCrp
 MB6PAwvNcwxKaSPZCbxWuFOF2Z5Bt8RdfRd+w5zqxm93KpJW1eC/kJFQx3Hh1y7V/5NxnPSmz
 LaGVomSXxwSF8SXJ96uoo1+M6R5sDhkAUIP94MMrr03OtNHA8IotzgLlFPhy1BeEmsIlS4+jZ
 u6wkfw1/hLfXUrWypYty4igCO+m3OiWsLhk1uMLxwPXXTELvB2bEWOgGKkqbf85VjRdbwWZu/
 VEDAmLlgcXC3itZTlI+n0f/NtzG0luwzY+yWQuFvYIJjFD8hMOu/UAfINKXbzn5FOeQLtlqpB
 FAIsEf9/dfOjEaUW5RQGsTVldjMEtNNwEBj2F6uEyoTaRaDOlUHG5A2PR2ZOahMefNPUJsHwk
 1jYmQBpaghlUec/ONGFnBNRgw3Yp4iEhgx3tCOYfcaGnnOVp245Rg84E1veJT1S+FbiOQT82e
 +BzUAaX/3ox63gO65E1ip8lunt2cb/nh7Btzk9kK5JJ4Ak3DSUszVvvixC5S3UNv9LOaAzIxa
 bRZzZB06kTOGem16XPE8G2N6k6kq1vgZ880ydPwq/DQvbmdFKolW449jX6gtQeltS4OharF7U
 BNx+cZlno/jgripkrTDYCyJk5OnTKumLR+IQ+B0LjTbvwfDKYs7ct3ki8nwj9HELjnDH2zqq4
 FKB5PEr5bGrmgPw0HO5GvBaWSXhi/4IlvBy+YoBBgjjS1V4Ve2urF/yk8YPtamHJ+shEsRDLS
 0j1WwUSd/CwBuek+GDxW6GeFDtkiTtjcD/mY6KpalOOgRHKGiOAgk0hv/iFoa8m8N3Xz0Vuk2
 1iWdwrQVmN6uqbM4znFOd5lvDxzapuKKEMNNJTCsb2nkVzDVfkNR2WNWuu06uoBu74DBc88cn
 gq81nitU7W86PmZIKTNN25iRJB7TJ9EGRojEOo9AI4dLAhEDYFX6K4ll1y/zUY3T++DE3jUfo
 cFi3P15I3XzMjo7V+FWqE7ro9jz6T6Loq8DpxTTMJJloMxA7yT4YkoAYyHwfYHELqXAnePu8s
 kT1QEUsW8Hu+awGQv+m5PtK2TmSSwiqcKrHdUR6Xg12Zw5I9lxH2hwEXqRdQzbE/9gv+VHwa8
 Tl6EUJvjuWbzcRxTup+cMKzzEGsUEBRR9BsBLopLJ6I1VX+WZU+5HV0EdwY01opmFPbdurasl
 ThC+KF7WU38vFkFQvCSaRbD6aOACmLCIFX7Lvs1GG3lODNCKb/pDnE29QqEsAatKCyx1kUvcX
 IuVkr+I+bCAJ1gHOujjnXfkYYvyKfTUAK2d7MBwMZrMLXnPsScYp4LcawbpVoCr0V2fDZ4PAP
 /tWnZI3qojk2zLo+9LGtpEKmn58hDNU7hNl3xKXa12ciQfQk+QwbQ0Q1ram6imVH8fRwmImf8
 mcxGFXUlJy+qDlHA0qRoczA+jbW8RyhmostV2YbtHGFH7L2ThKN+rlxtuPtYYQ5gyDFKw5MvZ
 aabuPvzRvMthrMhN8azR+c1HVmNb8VPZruTBOJEOjREi2K7J8uVi73Ad3A430IrbR87+///hR
 ASG9NUmMvQDdrzRfFI=

Modern LG devices like the LG Gram 16T90SP currently do not work
with the lg-laptop driver due to a number of changes inside the
underlying ACPI interface:

- events are now exclusively delivered as native ACPI events, the
  legacy WMI interface does not work anymore.

- the "WMAB" control method can return both integers and buffers.

- new events where introduced.

- strict keyboard backlight interface.

The first patch fixes and issue inside the LED resource handling,
while the remaining patches add support for the above changes.

The patches where tested by users on bugzilla
(https://bugzilla.kernel.org/show_bug.cgi?id=3D218901) and work on
both "old" and "new" LG devices.

Armin Wolf (5):
  platform/x86: lg-laptop: Fix LED resource handling
  platform/x86: lg-laptop: Add support for native ACPI events
  platform/x86: lg-laptop: Add support for additional events
  platform/x86: lg-laptop: Improve WMAB control method support
  platform/x86: lg-laptop: Fix keyboard backlight support on LG Gram
    16T90SP

 drivers/platform/x86/Kconfig     |   1 -
 drivers/platform/x86/lg-laptop.c | 643 ++++++++++++++++++++-----------
 2 files changed, 411 insertions(+), 233 deletions(-)

=2D-=20
2.39.5

