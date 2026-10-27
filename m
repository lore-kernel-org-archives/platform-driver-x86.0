Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=57.103.88.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793115627;
	b=HSkdeb+89pLQRN+D438Hh4doqCqwRkWSbRev8qm5ZtT6j/BZ9MSh6BkDWDbKU9DnP8A/
	 7IHXjkiG1NClpkwyy6IMuybqPpi99zY//5GsMxt/LQG++OECCTt5llCKt4FY0pEDjirFq
	 j3vrkbermiNc0bpO1ucoMuMOOQ3Mvk4QafuMo22lnra/R0hw5/A4ARjFY78ZEvfpf/13K
	 CbJG8JAPy24n9ZidCG3Hqw5jdT9JjsrCWtqzKimW45zBQ0qUwDEBsnB6edfbcE3XLgF+s
	 K0M7+O9ZKHKljN5YliTdDtedWp6UzByNknIKeWQuuCeUTg3Zq3Y5jtTwGd/zEHhYphg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793115627;
	h=DMARC-Filter:Received:X-ICL-RepId:X-ICL-Out-Info:Dkim-Signature:
	 Received:Content-Type:Content-Transfer-Encoding:From:Mime-Version:
	 Subject:Message-Id:Date:Cc:To:X-Mailer:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Info-Out:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-JNJ;
	bh=bhk07IlzPnC0mdVE9Qi7HXlpOXPap+zuak38Rn9z00M=;
	b=iBexq6pRqI2kNcVN93NmjNZFCqVWpfJtiOM/invGsEzRjZAZtYKIwkPlKB+VlpQUC9PZ
	 D8rXWkMy8ZO2Kuz3VpILxCEZm7s+4uP663TH95kzyXp/iCjqeEW9lfDBSiDqKs8R+hhnr
	 DOzDdZ5eldQPlVuHDaDDcg5U1N6mv5rxtUSsNdcF7fQBvVvTe06gl3UWcgJJ3QKMcZJVd
	 TosbYejceTIj5mmRHHbEqlYwnjkhM0daUrjjkzedRRrhThVsBiKZW35n3Oeh4DPO3Ffhn
	 BxEW8IrqR+e+T+giWO06aSgLmiGgeJbXHZl6tEfUCCBB8Tuo0pPILhSfbwMShyFcSXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=icloud.com;
	spf=pass smtp.mailfrom=icloud.com;
	dkim=pass header.d=icloud.com header.i=@icloud.com header.a=rsa-sha256 header.s=1a1hai header.b=hL5phtOb;
	arc=none smtp.remote-ip=57.103.88.33
Received: from outbound.ci.icloud.com (ci-2007c-snip4-11.eps.apple.com [57.103.88.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCEF7606A31D
	for <platform-driver-x86@vger.kernel.org>; Tue, 27 Oct 2026 15:40:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCEF7606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=icloud.com header.i=@icloud.com header.a=rsa-sha256 header.s=1a1hai header.b=hL5phtOb
Received: from outbound.ci.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-central-1k-100-percent-2 (Postfix) with ESMTPS id 1958818000AC;
	Tue, 27 Oct 2026 15:40:23 +0000 (UTC)
X-ICL-RepId: 01a17e05-1236-72a7-ac58-a72d4b03bcba
X-ICL-Out-Info: HUtFAUMEWwJACUgBTUQeDx5WFlZNRAJCTQhBB0MGWQReCE8EQwZdAFBcHA4DXghdG1wLQAFSGXIZWhRcGFNFUR9UWFUJCgJRHFYNV0NUBF9QSxsOXxcDVxxWRVwYQwldBVccHQ5eRVsTVRdGCRkIXR0ZCEcfCjADQg5WA0MHRQAtGRxXUF4IXh9MHB0OWAYSHVAcDlEPKgdICEoCWhoqdjMNVQcpdFkfMXxKAkAGKgtCDEsEXgNacEB5EVABWB5WXloXXlMXH0sAXEVaDlsERxQ=
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1793115625; x=1824651625; bh=bhk07IlzPnC0mdVE9Qi7HXlpOXPap+zuak38Rn9z00M=; h=Content-Type:From:Mime-Version:Subject:Message-Id:Date:To:x-icloud-hme; b=hL5phtOb/AD6vnacsK3jN/SGD0G999zekrF6GgwNyu5Ts2LvABPArO5qdxNNpksyA1aCdmfmQEM34H3lrjlo1wkB4LDoX/5eR164kvH49pm8oQDZ4LzUm5jClV7ZHvjf+yz9PxgSRcALqFCtMVttXLFWiiApP+gV8VM6qQKZgRjpzAhJI6vRgXpWwIPaMhF4jEc15v24JJBKWLvMDoIsdurdC09yWS+K3ZHZMDHXSPmOzA2+g+2YzHnJeoB89R13M31cwAc06z2OSufsnFyynkZc4vYf1emyXh8p6XtW6YL30FaHxh560tHBNkobLkJl0sfItS10b5gFYjSWaPd4Sw==
Received: from smtpclient.apple (unknown [17.57.156.36])
	by p00-icloudmta-asmtp-us-central-1k-100-percent-2 (Postfix) with ESMTPSA id 1CBD718000B1;
	Tue, 27 Oct 2026 15:40:23 +0000 (UTC)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Nico Kessler <nicokessler@icloud.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (1.0)
Subject: uniwill-laptop: XMG EVO 14 (E25) support - DMI entry, perf profiles, kbd backlight
Message-Id: <8A581217-ADC4-4DC2-AE21-1A92537341B0@icloud.com>
Date: Tue, 27 Oct 2026 16:40:11 +0100
Cc: platform-driver-x86@vger.kernel.org
To: W_Armin@gmx.de
X-Mailer: iPhone Mail (24A446)
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA2MiBTYWx0ZWRfXzs9ZzcPRwkPp
 wAaXaDVX0E78XcM6GqvbeCIYINBo1/UzdfZxJV5fiTxSnfHsJ9hpo9JaIeCdNaf9QVV5nwOiLyB
 JS2cwQaF7FAYMJNvyFgAkXtHQzO/QGssyuDIeE6g1ZZ98N6TgcNsm2egJ8UwCZg7+hO7+yfFCga
 j+O5XMKhbCqj7p1VHYxPC/xsT1V0NeRJ9ydSx9so0zMB0gY/uLug26hRNNRV49ZJEJKMPfGIr6/
 PTwXUUMvWMnebGUoGttv8O5l4aFo8WjAbRwa6BfPsZQI3fVQXUXo5o+mpwfSbcsp9q3Ntcz6tAg
 qraVx6HfsxGmzHwd9VBaVwEPjK0gEjhzjm+b4X4gumSqQvh7W7Ma6QgvAUCLIw=
X-Authority-Info-Out: v=2.4 cv=dPGrWeZb c=1 sm=1 tr=0 ts=6ae0c5e8
 cx=c_apl:c_pps:t_out a=2G65uMN5HjSv0sBfM2Yj2w==:117
 a=2G65uMN5HjSv0sBfM2Yj2w==:17 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=x7bEGLp0ZPQA:10 a=I33BB-NrOFoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=ExBMMWBsqpIJ5dCjq68A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: vjUnr_W7fs9C5AXS1kxMty7GEgCJ54eL
X-Proofpoint-ORIG-GUID: vjUnr_W7fs9C5AXS1kxMty7GEgCJ54eL
X-JNJ: AAAAAAABgtdTuYaG3yz99xaajw69OIYylL5tEUFU/9SurYjW80NZQMplkrTV9gYWASeHhEegL6xWh5PioZsV2CDXfNMYwUSULfs4tJbp+urDuWHxcpI0Hq9xr7ZV4OBQ7oeBlg1wWQQn7BSCT32Bu9/aqlRPjrSc8GdpN3/IjX3glvDRoFDvFPhbmeEg1a0ulJTvu5054CcY4s8F5blg4fYA3uIXl6UfLTVyRqqhgsaPfB+5WCOP7ZcNjpCl2ytyY01qlZ7ftsZ+UkHWmx4IC8MEkZqBqdl00MgKTCONhoYVZuhQ2jXCLQ5gK053DJz+3R+mZAd69hA/8wcVK7OG/4l4Gml0fmeEVwHBMtZs7HBPjPPfm+79bBu8ni5HTzg7USHferOdE6jJZ3ii9BeKbpwTfRIJjTmGFmVKWs9LRcUMIkQnEHaAoPootlYcRSN5fi2xZZT+d/0Q2EkZ0DoxYV602J3UX0RTSjuw8jE6XeJdeZOlufLaupGVVu4bBp/gTm4eoxeE+rVAacNqOMydY3FxKLmvdNHC9+5NccpM7Eru7jZikYIIb/4/cSBhGNDA5/hHNbr8/8P5ob1JWthIWj+XPn6T9z4XgGqDX6gHGVnCCL+Y8S8sPTGCCgIF2053CJ2a60ZZb/Pj9qw37b/B83WelIp/asdFdkxUI35WbnyzBB9em7i0ulOEtZcF0c7uBt9GgcnHhAbU8irOkNuow4oxtbwU+q6uCZbeEAKmNzWmvKgGXmeBKXd8A0xLEOWdXtweaEi3Ap2M2D+wmYJvAm8JHoMSrqDZasDNNEQujQl0fricxyZL026LOga8IPCo9cpapGKm8p1e3uQErKDVO36Cyqf6zgDzDpk8Xes3HdO8dJS6zNG7LvMSPdcKjkONiBW6dyXCbNs83bWxPUgn90xwcEM7p4jVGukFjZk/o2bpaXQ/Qs24uBxxGICD4XoygU6Y6tpeZlVwecuPGwH4bzPLgm/edCq
 UjMblHBMj/vfICY8LznrFuZ2VQSp8Vbk+llMoCiiD0vyulVJr1/llLzBk/0gpk1nPevtJvK7kQ+tbjLiotlp29o0QVb0jzoJ7efhqyVz8I+LRfcsbdnXNxpUVrW1DA8aCKc48X9ojEtH4ACjpXZRfX+7PDB//SLUK61Rbny4Cj715r+JzlNaY0HbcSnG/KLLRC20DZOuf2EVqVb1XOPqf6aomEDGsbGDdLfmgJmYKANp8GKaFuu2WZBuJh5hpakjp87DZ7zup4VyW3lN6CBN5y28OpJnSfO+7gruJG3yO9KrAIXJS2DytXZYxJjVOdsTbzd8=

=EF=BB=BF
=EF=BB=BF
Hi Armin,

the XMG EVO 14 (E25) uses the same board as the TUXEDO InfinityBook Pro 14 G=
en10 AMD, which is already in uniwill_dmi_table, but ships with a different s=
ystem vendor, so uniwill-laptop does not load:

sys_vendor: SchenkerTechnologiesGmbH
product_name: XMG EVO (E25)
board_name: XxKK4NAx_XxSP4NAx
CPU: AMD Ryzen AI 7 350
Kernel: 7.3.0-5-cachyos

I built the 7.3 driver out of tree with an extra DMI entry and tested it for=
 a few hours. Findings below, all register values were read back from the EC=
.

1) DMI entry

With tux_featureset_4_descriptor and vendor "SchenkerTechnologiesGmbH" the d=
river loads and works (charge_types, hwmon, fn_lock).

2) Charging profiles (charge_types)

Standard / Long_Life / Trickle map to the three profiles of the XMG Control C=
enter on Windows (OEM_4 0x07A6 bits 5:4). Two observations:
- The firmware resets the profile to Standard on every boot (and when settin=
gs are saved in the BIOS setup). The Windows XMG Control Center re-applies i=
t at startup; on Linux it has to be set again after each boot.
- With Trickle the charge ends at 100% displayed with 16.75 V (4S pack, desi=
gn voltage 15.4 V), so the reduced peak voltage seems to be handled by the E=
C as XMG describes.

3) Performance profiles (not supported by the driver yet)

The three BIOS profiles are selected through 0x0751 (EC_ADDR_MANUAL_FAN_CTRL=
). 0x07E8 reports the active one. Identical values whether set in the BIOS s=
etup or with the XMG Control Center on Windows; a full dump of 0x0700-0x07FF=
 showed no other related changes:

profile 0x0751 0x07E8 sustained PPT (stress-ng)
Balanced 0xa0 0x08 25 W, 62 C
Enthusiast 0x00 0x00 45 W, 81 C
Overboost 0x10 0x01 65 W, 94 C

Writing 0x0751 from Linux switches the profile: 0x07E8 follows within 2 seco=
nds and the power limits change as measured above. The setting survives rebo=
ots. PL1/PL2/PL4 (0x0783-0x0785) stay at 0 in all profiles.

4) Keyboard backlight (white, 4 levels)

KBD_STATUS 0x078C reads 0x01 / 0x21 / 0x41 / 0x61 / 0x81 for off and levels 1=
-4, so single color with kbd_led_max_brightness =3D 4 fits. Fn+Space is hand=
led by the EC, and the EC turns the backlight off during suspend and restore=
s it by itself.
Note: uniwill_kbd_led_init() would set ENABLE_CHINA_MODE in 0x0782 here, bec=
ause CHINA_MODE is not set in SUPPORT_2 (0x0766 =3D 0x90). I did not know wh=
at that does on this firmware, so I skipped that write (and the suspend/resu=
me writes) in my test build. Writing only the brightness bits works fine.

Could you add the DMI entry? If useful, I can send my test patch for the pro=
file and backlight parts, more register dumps, or test patches.

Thanks,
Nico Kessler
