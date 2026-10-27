Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=57.103.78.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793126429;
	b=r2FsSrUmdDRiHdwbLmR1/hAuWMOlTmbGpaLcc/BJPw2Bpyj1/bwuvTU0VeeIYTkx3Tb+
	 Sopp2+dbOS5Hm6u0bkpmhChQ4aZ/ppjq3YU0A6jYa6O4X+VrmxgtdSyIFOlnQgFxbpBmA
	 lMG9HgzMbf1noReC6B3879dfC2X858CB5ZnEoMZmv8ThogpBbe5mUrs02LZBv9pKl5U1p
	 yAW0j6WQKufoJxCT64BXbnsj69c/E1T09lJHrz9+Nxp6imjJ9QTzzL0I9CFPLX8DLr1Mq
	 wcMD/MMCd+V3BcOAtTOtPSLLmnoVZG/RSFxIWc/jHde24OchaCGEj60VWOymd6yuIbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793126429;
	h=DMARC-Filter:Received:X-ICL-RepId:X-ICL-Out-Info:Dkim-Signature:
	 Received:Content-Type:Content-Transfer-Encoding:From:Mime-Version:
	 Subject:Date:Message-Id:References:Cc:In-Reply-To:To:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Info-Out:X-JNJ:
	 X-Apple-Category-Label;
	bh=XMU+3G8HBaynD9dIwGaICL1HKcImQ5K9TgHl0FD0niA=;
	b=pSdiEF32Bk//zANbQTAa4Rb3wfvzOSNgmiavzmqpgbrnVrsVKG3Zrbajexcjysk5twAR
	 Wzctsz+8PI5wheJfYcvRWdxld5o0s/ecznxqlSzKHmufH3kjQ7IixG+eqadWau7IL+CNq
	 H53Sd1xacyfUePaNaJzb9KvOC4Sc6zUxp5YGO8vQdzmCx5m3++pUeH8DBNlQapn/jA3Ac
	 gwb6MdgFRdtiZ7JcGPnufCQLCD8J+4Gzsn0jwMLp7h6TGTBhvCVk3Ia8Ah3wypOMiYj3B
	 mFJ/QYrGT2SOCa8zXTrjDJkwEkfCU8L5KZ8vDz6sYsocI0aVnr611/4QjnpvIGqRLuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=icloud.com;
	spf=pass smtp.mailfrom=icloud.com;
	dkim=pass header.d=icloud.com header.i=@icloud.com header.a=rsa-sha256 header.s=1a1hai header.b=nhtyjeVi;
	arc=none smtp.remote-ip=57.103.78.227
Received: from outbound.st.icloud.com (st-2004j-snip4-6.eps.apple.com [57.103.78.227])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91025606A31A
	for <platform-driver-x86@vger.kernel.org>; Tue, 27 Oct 2026 18:40:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91025606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=icloud.com header.i=@icloud.com header.a=rsa-sha256 header.s=1a1hai header.b=nhtyjeVi
Received: from outbound.st.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-1a-10-percent-1 (Postfix) with ESMTPS id 3800C180036F;
	Tue, 27 Oct 2026 18:40:26 +0000 (UTC)
X-ICL-RepId: 01a17ea9-e622-7287-b7e6-444c5e6d8de6
X-ICL-Out-Info: HUtFAUMEWwJACUgBTUQeDx5WFlZNRAJCTQhBB0MGWQReCE8EQwZdAFBcHA4DXghdG1wLQAFSGXIZWhRcGFNFUR9UWFUJCgJRHFYNV0NUBF9QSxsOXhcDVxxWRVwYQwldBVccHR5DRVsTVRdGCRkIXR0ZCEcfCjADQg5WA0MHRQAtGRxXUF4IXh9MHB0OWAYSHVAcDlEALXcxCEELXRoqdDMPVQcsASgfSA09AkByUwBAe092W3QtATN5EVABWB5WXloXXlMXH0sAXEVaDlsERxQ=
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1793126427; x=1824662427; bh=XMU+3G8HBaynD9dIwGaICL1HKcImQ5K9TgHl0FD0niA=; h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:To:x-icloud-hme; b=nhtyjeViuFrPk1iGa1JJVPw+lzTMwUDwRlWEYjaA5UiB3jz8cK/q/Ao8KBUWggQ4deiZsCyclZ3ep6rZvWZS584DNWhChEoGnyXYOvBqva1mzEiHtU9HeCSgIaawuUMgLVClCRYP8/XFB2OaHeaisqhNv8EZT3xKcHV9lIe3wj2MlDQR5UJAiieidMDQrpya9w3Kj39ZEuEnfSw622Esb5Rpqd+OdE9+RLChPF+vuaxL5k7IUciXKnRt0O37oLvluV64ZN38Eh4o9yXRzjRVfKgXZfhiGVwXQ/fEHq7CfBdoWjeLj5S0YODR6oxVdLrNmxboIAPywWrqG34Dwn4mrw==
Received: from smtpclient.apple (unknown [17.156.216.30])
	by p00-icloudmta-asmtp-us-east-1a-10-percent-1 (Postfix) with ESMTPSA id 403A41800375;
	Tue, 27 Oct 2026 18:40:25 +0000 (UTC)
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
Subject: Re: uniwill-laptop: XMG EVO 14 (E25) support - DMI entry, perf profiles, kbd backlight
Date: Tue, 27 Oct 2026 19:40:13 +0100
Message-Id: <7FEA1980-AFC6-4A6C-84E1-E820B7E6CF3C@icloud.com>
References: <8A581217-ADC4-4DC2-AE21-1A92537341B0@icloud.com>
Cc: W_Armin@gmx.de, platform-driver-x86@vger.kernel.org
In-Reply-To: <8A581217-ADC4-4DC2-AE21-1A92537341B0@icloud.com>
To: Nico Kessler <nicokessler@icloud.com>
X-Mailer: iPhone Mail (24A446)
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA3NCBTYWx0ZWRfX+BcDlJEx+XGT
 CUTkaBhm8no9ql8OmpzVdWpAOOs43c21qJ62rWzS/QGN5rPdxbdEvLb+9obwFSL1bTeJkjBZt4L
 Gpr54ndbpgRZYAhCZ0supfSrWF5WBYFtSWVHU8F0/YtoVny+YtIbJ3N0o7iCZYyXkKW3lWo0jIb
 qydmZrev5cjsWIk9YPuac8ZMZGdZvI4Y8JBaluMJq/evg/7oNNlVulbA7a4wF4pUJ1Que7HkLGU
 lfpIbLdCqIcaGmk1052Xi57SRl4PlZ14BjDSrvFJBEgRR+ePB/ZJU4XsIF5J+EwaPfH/RmQLb11
 0r4PaHtlym4yfgWy+xFYdq9/TP+Eu356UO/TbenRSe8uShtYcfrHkSBa7IPF2o=
X-Proofpoint-GUID: kKyWm3iqCKm1AUyRUXfEIyht4Z3bxaQh
X-Proofpoint-ORIG-GUID: kKyWm3iqCKm1AUyRUXfEIyht4Z3bxaQh
X-Authority-Info-Out: v=2.4 cv=DvZbOW/+ c=1 sm=1 tr=0 ts=6ae0f01a
 cx=c_apl:c_pps:t_out a=oyWFxbOnq+dmhQrAPgaJYA==:117
 a=oyWFxbOnq+dmhQrAPgaJYA==:17 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=x7bEGLp0ZPQA:10 a=I33BB-NrOFoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=v3ZZPjhaAAAA:8 a=QDkwp8o-igpvZNlWdrYA:9 a=QEXdDO2ut3YA:10
X-JNJ: AAAAAAABa8HZPOPdczs0eX+h/p6+3HlsyWuip2kSGr0i60JFdhYfl37bIzx+Mi1GRPMhILMVyBnqZJJB7lnGL3RazWAT0FvbnIb6z9tp4J0z0V18DrJsh/L6yTPB3WbSj25nYGbylUvmDeyOwVu98f+PArUhFp/5qAOzPKCiL03bhjBlmHqCD1wD4mbb+5FppelQMfYnTNgowSFBmte0uk00WrHmBKmRR2/J0VGUkJw5GbGuPU1OdLIrZ578QRvVH5ca14TqaHg/7smyEjeTxsVlThesOUXfVfI3tsSCmyWQzPXYqD4RLwVZ6rQvxxZswvYOqWw/0A9EIqRftbXoMLgbFZo38jDv163oW8EI19mXzG/v05iqbGH/12EDtfTlLfH9Dsgy/uGZSB8o+LfXY5cZWhkuG4EpRX68PM34toXUgyG173vZ2L2ol0VP76o/m5B34KmZ1+s5tJQxsguxl8PeizhQppzuMkP7XcX+mJvST3rUgxBWss+buH7WjuxCdZbNMXbFlENu+Ik+tZgGvVKzPOziG3jC02tmRPT3f3/TUt1r8C36r6j8vO4suw3SydwPUu/bwbRVQJ2/i6hERfu1JH8JVyW43eGnfrEV0i96l1P7thOJBHhX0sLU/JbnRAWX2mfBKNGJY4HSJ3uxXmdua4HyJ49cdV16pu8vWTQr5moWWEGatHGXquL/uYWTlNhBwgr5zEhBOJ/hXUaR5ZSmwb9bUFDU9KVTGTAnEsiNQ2LfRe26JHappo+PJ32fqIxuvJ4Y+x4vaXxDFz9xJND9bPm+4qBFPudVk/e+1/cGfmN5StlHQJ0TM3KlcHdydvkZHB7YoHoFpFjPRP+J0QjHa/shTbszwkxSMWIr03PROz2aUSxkFFkopmSDnvyaJra6xoeCE+qVS3IH1WhKk7WQwfS3YWXu88qtLCyMuPoIXCF3J/GF+KBE9Ux/MyFWaRE4/M0jIZJIdmztyVuxZCxCztTLA75
 9EZbJPZ/pvW6O36MMyEUd9jq3+ekQNcykOmyhUX43s7YygSHL1+2y/wpWaqsChTdqR0oIHQcsN7Isn6lT9uMFYQdnAjSw6qfYHseVAMrM13nYwOEuuttf5k/KBgTcMN6vwnIv22lapLDljj7p7P3u4V/7Cru10zaOo25gke1acTjSklf3tB/vtkoADwUSCGZaGzlrK1/NQZHuKIsEddu1kRiex7QyV//61eFyUoX4IntMMtW6tzMIFf8HLNJ1yygwVYKwXsXIuKxD1PrtaydGI2vHbJZDnrtyn5KHqRGVOm+IsHnH9DT3FgWzeeZZg5q7cuj+1V2LQ1ZW
X-Apple-Category-Label: MzgxMDkzMTEzOiRjYXRlZ29yeSRfUGVyc29uYWws

Hi Armin,

a short addition to point 2 (charging profiles), now that I measured a full c=
harge with each profile:

Trickle: charge ends at 16.75 V (4.19 V/cell), shown as 100%
Standard: charge goes to 17.62 V (4.40 V/cell), also shown as 100%,
still in the CV phase at that point (1.1 A)

So the EC limits the end voltage in Trickle and rescales the reported capaci=
ty, the OS sees 100% in both cases. During the Standard charge, 16.75 V unde=
r 2.1 A was reported as 86%.

Thanks,
Nico Kessler

> Am 27.10.2026 um 16:40 schrieb Nico Kessler <nicokessler@icloud.com>:
>=20
> =EF=BB=BF
> =EF=BB=BF
> Hi Armin,
>=20
> the XMG EVO 14 (E25) uses the same board as the TUXEDO InfinityBook Pro 14=
 Gen10 AMD, which is already in uniwill_dmi_table, but ships with a differen=
t system vendor, so uniwill-laptop does not load:
>=20
> sys_vendor: SchenkerTechnologiesGmbH
> product_name: XMG EVO (E25)
> board_name: XxKK4NAx_XxSP4NAx
> CPU: AMD Ryzen AI 7 350
> Kernel: 7.3.0-5-cachyos
>=20
> I built the 7.3 driver out of tree with an extra DMI entry and tested it f=
or a few hours. Findings below, all register values were read back from the E=
C.
>=20
> 1) DMI entry
>=20
> With tux_featureset_4_descriptor and vendor "SchenkerTechnologiesGmbH" the=
 driver loads and works (charge_types, hwmon, fn_lock).
>=20
> 2) Charging profiles (charge_types)
>=20
> Standard / Long_Life / Trickle map to the three profiles of the XMG Contro=
l Center on Windows (OEM_4 0x07A6 bits 5:4). Two observations:
> - The firmware resets the profile to Standard on every boot (and when sett=
ings are saved in the BIOS setup). The Windows XMG Control Center re-applies=
 it at startup; on Linux it has to be set again after each boot.
> - With Trickle the charge ends at 100% displayed with 16.75 V (4S pack, de=
sign voltage 15.4 V), so the reduced peak voltage seems to be handled by the=
 EC as XMG describes.
>=20
> 3) Performance profiles (not supported by the driver yet)
>=20
> The three BIOS profiles are selected through 0x0751 (EC_ADDR_MANUAL_FAN_CT=
RL). 0x07E8 reports the active one. Identical values whether set in the BIOS=
 setup or with the XMG Control Center on Windows; a full dump of 0x0700-0x07=
FF showed no other related changes:
>=20
> profile 0x0751 0x07E8 sustained PPT (stress-ng)
> Balanced 0xa0 0x08 25 W, 62 C
> Enthusiast 0x00 0x00 45 W, 81 C
> Overboost 0x10 0x01 65 W, 94 C
>=20
> Writing 0x0751 from Linux switches the profile: 0x07E8 follows within 2 se=
conds and the power limits change as measured above. The setting survives re=
boots. PL1/PL2/PL4 (0x0783-0x0785) stay at 0 in all profiles.
>=20
> 4) Keyboard backlight (white, 4 levels)
>=20
> KBD_STATUS 0x078C reads 0x01 / 0x21 / 0x41 / 0x61 / 0x81 for off and level=
s 1-4, so single color with kbd_led_max_brightness =3D 4 fits. Fn+Space is h=
andled by the EC, and the EC turns the backlight off during suspend and rest=
ores it by itself.
> Note: uniwill_kbd_led_init() would set ENABLE_CHINA_MODE in 0x0782 here, b=
ecause CHINA_MODE is not set in SUPPORT_2 (0x0766 =3D 0x90). I did not know w=
hat that does on this firmware, so I skipped that write (and the suspend/res=
ume writes) in my test build. Writing only the brightness bits works fine.
>=20
> Could you add the DMI entry? If useful, I can send my test patch for the p=
rofile and backlight parts, more register dumps, or test patches.
>=20
> Thanks,
> Nico Kessler
