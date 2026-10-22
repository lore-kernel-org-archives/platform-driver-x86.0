Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792680563;
	b=d3dwe1seBiNPGMsmNZS3+dXXywSYp1nbTSqzwmhTvkeItbRZ0Vwv5KpHR6ha7UX9HFT+
	 N8SbNHdvhBXaY1KtpOfuBhrKkxKsRXGBHG+X/Im8qSxDA8PWifqNnUIN4DdAW1xZlJgUX
	 lliFF+GGc2mK/8f1Lo2sCNWYNKm85RQk6Zyf3tFWyvq0zeBAS9swPJ/WZnbxzvP8OJFGm
	 PnCKeYBNpcAAGQG28zRTACX1mT2jFo/3lba1bbzid6q+GdBmMzBPfxn/V6IORUOsoTaD9
	 OAGu8V8cyhxXW8I1AFqzE3reznQGaN5HMaKxhtDXRj8BWSeXAxxut3guxdUAnNhZzFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792680563;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Content-Language:To:Cc:
	 Subject:Content-Type:Content-Transfer-Encoding;
	bh=a3+EQxIMtcrq1YGsTb9eL9D1Lk2ZYdvnU5JG4LYpWzA=;
	b=IJSsczxQ9jl1GOgtFxdMIoFl90jdI1bA64gqmXxOHKHLdEzOAZ/EBeEEOXi51Qxh1zrB
	 tYDohDwN5RVXETiyCFcEAcqMm3TDKmdFvGg6KHEWZzAKAS1gQOCZ/dHW2WAzieDPyDhwF
	 YaTMflJPGMuGpmJESEiTYLL6BN6/Dx73G8ZbV3GNquaZPLYV3AX9IJx8I8sShCyxRvtV2
	 g0WjN6DaSOWTNS0ilWPkDiRy7934733JBBWSz5eY1cLjXCQXRsg1IbarGVoSKlialhH8p
	 yRwMAWqLAGJsdDmAIHsUB+PF4QwgDFIHFR8Xud6g7EVk8uxm9blUHmuFsKOqkoZrHGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KM48YCup;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C22460A3838
	for <platform-driver-x86@vger.kernel.org>; Thu, 22 Oct 2026 14:49:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C22460A3838
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KM48YCup
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a1e266fca2so13922855e9.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 22 Oct 2026 07:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792680562; x=1793285362; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:subject:cc:to
         :content-language:from:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=a3+EQxIMtcrq1YGsTb9eL9D1Lk2ZYdvnU5JG4LYpWzA=;
        b=KM48YCupy7u7ECrfBEN6yF8pWAUnFdrLFsQiqOku8jspAXbKAyJAXCutku1v6bSnHO
         YYgxaUNIWtas3kBPRECXizWX+ghK//81NRqZlGdV/xjIN8hpda5+0YZn5++3NQoUx9Ut
         MmtjXr4zyWLhM2zXTnQNilkAZAr7xVHlhieijFALFlVsy6O6rLWANfoxHUrRAN9ZAYFt
         tICS2sIZCZ3N5DXq47lMFqFVI3++swKeeGgymtCsanA2TyaV1d+/uWmmynufRX0QP+ZO
         /VAdjFmkHfb6csIpvvSbYbCYEJj5ExKX7Xdi34aCjCiQ4uCPWLwherkpvhETJ0cI3S6C
         87xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792680562; x=1793285362;
        h=content-transfer-encoding:content-type:subject:cc:to
         :content-language:from:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=a3+EQxIMtcrq1YGsTb9eL9D1Lk2ZYdvnU5JG4LYpWzA=;
        b=jhlHQapJO0uAao6falY0yECgl/oNzk+2BvpP0w/jLBeukfwE7QMlodGtk9gF70Ra73
         EAxel1rymjeQaBk9JxSSs81HWGnKj5zlMt2ymWszY4ig3Ti5unk7ORQCPUE/iLfjNLk+
         5JQSHWXV7wA3xU38htOwcQbROwrQ7w8wDgODemVe4pqsqwKifahNz+VWVyJgrFqf2rVd
         x4RfOrv1AWk7g2FJ7uMfcuehm+niGpelkcygP2/nUhRIpQKu4jU72PuCTbj0Mo1KaGwH
         o46nbh/mPDXFs09XljL74fjWeYnmyysz9T+QFHDw1yOcMSA3ueV44B6b7WlbvNCCYN3w
         OfvA==
X-Forwarded-Encrypted: i=1; AKwUvBwVYbYbS3dDan3hPS0Y82ZAeEjsCpFP3s9KI/lYFD9P/D2lDh1NGuZUkugDRmn6YQj3Rw5358ibx6g0f/uDFOmxET1e@vger.kernel.org
X-Gm-Message-State: AFq9FYIQ/vVEjY2Q4+oDrNbmRoEkbIR4FvhvLJG1yvPE2wygK5m0IcCg
	Z5S+y6bY67KrNwqUPRlbSUNxFrjL4xfUshIiYGjaP69eLN2eLusH3Lxc
X-Gm-Gg: AYBFou2dOgzIU9zAlv8I0nRU8kRnjWUgzjt4Nr1lOj3Fx4LGRCF4mY3XxHwslmj3lQs
	H3cfd9UR/Kv6lLuL/isTUEiQybzCRE1EnUM7NHJaZla55AfvKjH4Y8AJwDWYccpcSNMosTdMlvP
	i0dZ3D4rhzZ1QpyE44VTSxgB7c2QGg/k6yQmIF24wnqk9Sq+pm425Cz62yysYzpF5Hu9D5oD78T
	E1hDmuvgOisUwttNz6u5fX75PlGZhi7tcY7u/SbhdJeIoDqognE5qsmc9udBrpHB6V87Q51pNDo
	lA4JzvvoekYfYPT+wo4xYAxj9Hs6ACLm5VLqPrO0GBoe1g9xRyqRU3WDlcRzoLEB18Hdw4wCMJV
	+Q04jfJfBWG3BpyFBMhIcNi+1qU899GCAzQ7LOqcZhiQdTqgZRiXserkeExtk+NmME3NAVucm3G
	vtOb5kdltItx4w2wQy1/foiN6tAr8YE61fuWlLTEmQWyyJw8y4rK5JvJhzLwMepFAYu52DKBsft
	1rQhcUF1ZHHUOjF+Y4F6LfHEviukr3XA+yFjNmGP1+8l8r3NXAcItSD
X-Received: by 2002:a05:600c:8b03:b0:4a2:967:dfb8 with SMTP id 5b1f17b1804b1-4a20967e156mr34152665e9.20.1792680561369;
        Thu, 22 Oct 2026 07:49:21 -0700 (PDT)
Received: from [10.5.0.2] ([187.13.28.97])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a21029928fsm1365695e9.3.2026.10.22.07.49.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 07:49:21 -0700 (PDT)
Message-ID: <1d46e12b-ef21-417c-8bcb-b607ba3e32fa@gmail.com>
Date: Thu, 22 Oct 2026 16:49:19 +0200
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: =?UTF-8?Q?Katona_G=C3=A9za?= <katona.geza.1@gmail.com>
Content-Language: en-US, hu-HU
To: Mark Pearson <mpearson-lenovo@squebb.ca>,
 "Derek J. Clark" <derekjohn.clark@gmail.com>
Cc: ong Zhang <i@rong.moe>, Sergio Melas <sergiomelas@gmail.com>,
 platform-driver-x86@vger.kernel.org, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com
Subject: lenovo-wmi-other: no fan HWMON on Yoga Pro 9 16IAH10 (83L0) -
 CAPABILITY_DATA_01 GUID missing
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi all,

I would like to ask you kind support. On my Lenovo Yoga Pro 9 16IAH10
no fan speed is available to Linux at all. I went through the ACPI tables
and the in-kernel drivers, and the  only interface that looks usable is
Lenovo Other Mode (lenovo-wmi-other), which never completes binding
on this machine.

Machine (from /sys/class/dmi/id):

   sys_vendor:      LENOVO
   product_name:    83L0
   product_family:  Yoga Pro 9 16IAH10
   product_sku:     LENOVO_MT_83L0_BU_idea_FM_Yoga Pro 9 16IAH10
   board_name:      LNVNB161216
   bios_version:    QVCN50WW (01/28/2026)
   CPU / dGPU:      Intel Core Ultra 7 255H (Arrow Lake-H) / RTX 5050
   Kernel:          7.2.11-200.fc44.x86_64 (Fedora 44)

1) Lenovo WMI GUIDs present (/sys/bus/wmi/devices):

   DC2A8805-3A8C-41BA-A6F7-092E0089CD3B  Other Mode  -> lenovo_wmi_other
   362A3AFE-3D96-4665-8530-96DAD5BB300E  CAPABILITY_DATA_00 -> 
lenovo_wmi_capdata
   887B54E3-DDDC-4B2C-8B88-68A26A8835D0  Gamezone -> "platform_profile 
probe failed"

   absent:
   7A8F5407-CB67-4D6E-B547-39B3BE018154  CAPABILITY_DATA_01
   B642801B-3D21-45DE-90AE-6E86F164FB21  FAN_TEST_DATA

   lwmi_om_master_bind() returns -ENODEV when cd01_list is NULL, so the
   component master never binds. As a result there is no
   /sys/class/firmware-attributes/lenovo-wmi-other* and no fan hwmon.
   The fan code path itself (lwmi_om_fan_info_collect_cd00() and
   LWMI_ATTR_ID_FAN_RPM) only needs capdata00, and a missing capdata_fan
   is already handled (channels hidden, or exposed read-only with
   expose_all_fans=1).

2) Why the other fan drivers cannot work here (from acpidump + iasl):

   - yogafan: the machine falls into the generic "Yoga" quirk
     (\_SB.PCI0.LPC0.EC0.FANS), but there is no FANS/FA1S/FA2S/FAN0
     object anywhere in the DSDT or SSDTs. \_SB.PC00.LPCB.EC0 (LCFC0002)
     is an empty stub. The real EC is \_SB.PC00.LPCB.H_EC (SSDT
     "CB-01"), and its ECF2 region has no RPM field, only FLVL at 0x4A.
   - acpi_fan \_SB.VFAN (PNP0C0B): _FST returns a synthetic RPM table
     selected by \_SB.FANL, which is only written through a _DSM call
     (FIDS 0x04040000), so it always reads 0 on Linux.
   - acpi_fan \_SB.IETM.TFN1 (INTC1063, DPTF): _FST calls
     \_SB.PC00.LPCB.H_EC.DPTF.GFNS, which is only declared External and
     not defined in any table, so _FST fails (fan1_input -> -ENODEV).
   - ITE8 (SIO hwmon with GFNL/GFNH = IT87 fan1 tach regs 0x0D/0x18) is
     disabled on this model (_STA 0, ITSI != 1).

Questions / request:

   a) Could CAPABILITY_DATA_01 be made optional in lwmi_om_master_bind(),
      so that the fan HWMON (and the capdata00-only attributes) can bind
      on machines that only implement capdata00?
   b) Mark: does the Yoga Pro 9 Gen 10 firmware report fan RPM through
      Other Mode GetFeatureValue (LWMI_ATTR_ID_FAN_RPM), as Lenovo Vantage
      would use on Windows?

I can test patches right away, run the module with expose_all_fans=1 and
dyndbg, and send the full acpidump if needed.

Thanks,
Géza Katona
