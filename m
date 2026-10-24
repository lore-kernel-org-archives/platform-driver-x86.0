Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792818279;
	b=kuG8LXhWAkJgFcHvOFCzrihUYTX9VUh8aaYgdsH46Hf0oSsSQ32KrTC/4VRqcuEASkxV
	 8HlMFNAGWs+7yVDUw+X4iyggYMZjXfMjsjvg9WJ6JKXygmYX5SsP6W0v2zaq+T1ERzRfH
	 OguRNKTRsGFPOeDH7wOxEccev3AQlb7lGD3oGVX8ZCNIR7IfmbhFVwbWdS6I8eGKsaAsJ
	 VtdtDBUcgyhlxu0PZQNLTwVhrcIY/E6Q5EXT+t9BTBw1oWdahgQUg7LH1h7Jkm6Ul1w8m
	 0xw1EBkoMF5W5jBM5p8HJystHqBB80zICW6x1S+1tiKd8SSR2mMiP2TLT/Xx+L+UK3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792818279;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=ruR+AEBsbUs7uOjrkZAAWlBorrvNfuoHCOldl10pJgg=;
	b=4Ayhts2FAE6znUaClarKtG7wveWFAa8m4h2Ry3xLnDiwG2gi5vksWLmJ4L6x/DJ8kfQp
	 jKBnGYjrNKT7U6uYhXNzNEfy+IwDhOEICFB57y6reo1L+Gk4sSVp41wwgKyO8DHalk+Rt
	 G7TrHGynQYwPHodW6GqxRR5VXj9F3zBnG3IA6egsDA9IvuILMPkTMVFJws3Cvqx9y7s/q
	 xn1xlrIOX67n8WPUh4A8OktRI3hc1KqbIIKbA+AKTl4oDbhHND25OtQQsPJsygJRapm3f
	 9aHiXvY5CuQaUn97j9eL/vxCSsN0HuGkt+bFN4zD4ZAlXXyizdpF8tNf3/fYY5Om9RA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oZSlbim7;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90501606A31A
	for <platform-driver-x86@vger.kernel.org>; Sat, 24 Oct 2026 05:04:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90501606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oZSlbim7
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a1dede3c2cso16799385e9.2
        for <platform-driver-x86@vger.kernel.org>; Fri, 23 Oct 2026 22:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792818277; x=1793423077; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ruR+AEBsbUs7uOjrkZAAWlBorrvNfuoHCOldl10pJgg=;
        b=oZSlbim73jM3UMW68EDp8erN1t8dqIIRuFMmmNan+BldV3hxu+HaeT3kXWn+TN4Gvt
         M8jDtLBdt2BqT69nfFBSJd6tMLurik19WXtRHxaukqdBwhEi+zSPhAN2VvXhOiwdJvk2
         pUh+kOCN9+hZ+BCdjPK/gO2d2rIZP7AekpRYkhO9x4xWcA6ShPaHCecJCJz4ren7U5vO
         Ikln8Hn37FQCP2yX7DxzEzEOhiwBpCH6XndNmvIx8ET4ECTWr6QCotgetrTGoGaQ0c/t
         TXZZPGxoO7NcGJ7vUQIfxYmTrPlxuMRNE4SedMqO+LXPoz8jZw2bRPDxaf9VXXMjkF2C
         8pNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792818277; x=1793423077;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ruR+AEBsbUs7uOjrkZAAWlBorrvNfuoHCOldl10pJgg=;
        b=uTxcRBkkKHIyol6yEa5iBtn3rYXOmgsKvvlB5vzZ8mt41u7ezMRfPIgmDOW1RPMujw
         7rIPBQkVT9jLB5udaH7rlAx9NDWIqccT2tNi17HNLxAUipo4oFMkAaOjl1rcV3yQfIVU
         0cFAoCuvGZ3kcR5CsxHLZy0/BciKzw8PVBstktaIDl2yn8OCOPS5kTq2PAdqZA58T0m6
         Wpcy/CeDdy0aZ+m8Rys95KoW+DXE689WVPM8zdXJ7IyP7A3aKxVHy3H528l+0jvSFpv3
         XbQVXMeeK40lFCAw57egwv3bspV7wdRSuahKujrWdJHIdi1MJFwvuL6O91PuR7/oJy/7
         7aYw==
X-Forwarded-Encrypted: i=1; AKwUvBzpdTBZXyU9nYQZ7Ca4Ng3vgWQFSkmB6Rs7pHjffNRs1rzhkCD1WjiWQ6QY3wwMEKGmcFsmvCP0WwwUuBAvYcF7SP9J@vger.kernel.org
X-Gm-Message-State: AFq9FYKvdXlf/2bvdFjhhSJG2kJugOxrxmT6ev4BiahES+g7mhCRifmN
	V64dtldZI9QgmAK56CZKls29y9/RjOChqjNEpgUnSMVYVLwNq8JzuaYz
X-Gm-Gg: AYBFou0nEqZhdsqMa5E7Al9RC3XrYnCXhOuRtWZ10q2m4AK6wZQgF1oxZ0pVPCK26dS
	RcHHoDlPJbAY80iZQUCwNzp42O5Wnchtk40i49IkWld/pDZGog68VbaD85iDdKAZfYRkusq3JKx
	O6Z9sxRFjXifSi6wRmKF14AUxuOm2R//GR6HlpvMMxst2t4kVDSiJmh7Uu58VeeyyevHDwASL6O
	CpiFzbEceQMCnMV7pLwiKVAIezujwlZQVO6S/qGnVKjvfBxNM4Dcbd1f1uj40sPiags+nkGSVaE
	EOon3kpFGRg85Ih9vq7dtz2UQH2pSJP1oJcQHTUswj/DbMU11G+JRX4PQyANNAeRLm57GWAvZsf
	06739KSaCDqx5Pdne0KG9/jSwytiQtC8kZVgmSZRDJG0GWV3jzpTP4f/7eu9xfprKm8ct/9FdmA
	kY8e3Mh81nrx/48NxDzKtiQfKh390+8ZiSz/6U48Esv7Pw3F3SqOTR7CNsR2xOzCdslenuOcpYR
	Pft7kr/2zT3bo9cfal4ZE/WF4dq60p6ZpKCYaYSKcd+Tk/EuG7KcBuG
X-Received: by 2002:a05:600c:870f:b0:4a3:5991:718 with SMTP id 5b1f17b1804b1-4a35ac99b34mr12153275e9.16.1792818276709;
        Fri, 23 Oct 2026 22:04:36 -0700 (PDT)
Received: from [10.5.0.2] ([187.13.29.40])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a0bdd59sm19298215e9.4.2026.10.23.22.04.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 22:04:36 -0700 (PDT)
Message-ID: <0c6aeb87-beb9-4606-9b11-89d1f2aac857@gmail.com>
Date: Sat, 24 Oct 2026 07:04:34 +0200
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
Subject: Re: lenovo-wmi-other: no fan HWMON on Yoga Pro 9 16IAH10 (83L0) -
 CAPABILITY_DATA_01 GUID missing
To: Rong Zhang <i@rong.moe>, Mark Pearson <mpearson-lenovo@squebb.ca>,
 "Derek J. Clark" <derekjohn.clark@gmail.com>
Cc: Sergio Melas <sergiomelas@gmail.com>,
 platform-driver-x86@vger.kernel.org, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com
References: <1d46e12b-ef21-417c-8bcb-b607ba3e32fa@gmail.com>
 <98b1af05169012da3fdfa444d88f7e5e860dc2e0.camel@rong.moe>
From: =?UTF-8?Q?Katona_G=C3=A9za?= <katona.geza.1@gmail.com>
Content-Language: en-US, hu-HU
In-Reply-To: <98b1af05169012da3fdfa444d88f7e5e860dc2e0.camel@rong.moe>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Derek, Rong, Sergio,

thanks a lot for the quick replies.

I built lenovo-wmi-{helpers,events,capdata,gamezone,other} from
review-ilpo-next as out-of-tree modules against 7.2.11-200.fc44
(the only change: wmidev_exists() replaced by wmi_has_guid() on the
GUID string, since 7.2 lacks the former) and loaded them with
dyndbg=+p, expose_all_fans=1 and relax_fan_constraint=1.

The series fixes the binding: lenovo-wmi-other now binds with only
CAPABILITY_DATA_00 present. But the firmware declares no fan RPM
attribute, so there is no fan HWMON:

   lenovo_wmi_capdata 362A3AFE-...-18: capdata00 declares no fan test 
support
   lenovo_wmi_capdata 362A3AFE-...-18: registered 
LENOVO_CAPABILITY_DATA_00 with 3 items
   lenovo_wmi_other DC2A8805-...-16: Collecting fan info from capdata_fan
   lenovo_wmi_other DC2A8805-...-16: HWMON registration pending (00: 0, 
fan: 1)
   lenovo_wmi_other DC2A8805-...-16: bound 362A3AFE-...-18 (ops 
lwmi_cd_component_ops [lenovo_wmi_capdata])
   lenovo_wmi_other DC2A8805-...-16: Collecting fan info from capdata00
   lenovo_wmi_other DC2A8805-...-16: all fans exposed. Use with caution
   lenovo_wmi_other DC2A8805-...-16: fan RPM constraint relaxed. Use 
with caution
   lenovo_wmi_other DC2A8805-...-16: fan reporting/tuning is unsupported 
on this device
   lenovo_wmi_gamezone 887B54E3-...-15: platform_profile probe failed

/sys/kernel/debug/lenovo_wmi/362A3AFE-3D96-4665-8530-96DAD5BB300E-18/capdata:

   LENOVO_CAPABILITY_DATA_00[0]:
     id:             0x000e0200 [dev:  0, feat: 14, mode:  2, type: 0]
     supported:      0x00000007 [ RWV]
     default_value:  0
   LENOVO_CAPABILITY_DATA_00[1]:
     id:             0x04040000 [dev:  4, feat:  4, mode:  0, type: 0]
     supported:      0x00000005 [  WV]
     default_value:  1
   LENOVO_CAPABILITY_DATA_00[2]:
     id:             0x00000000 [dev:  0, feat:  0, mode:  0, type: 0]
     supported:      0x00000000 [    ]
     default_value:  0

This matches the ACPI code (SSDT20, \_SB.GZFD.WMAE):

   - GetFeatureValue (Arg1 0x11) handles 0x01010000, 0x01020000,
     0x01040000, 0x02010000-0x02030000, 0x00080000, 0x000E0200 and
     0x000C0000. There is no 0x0403xxxx (FAN_RPM) case at all.
   - SetFeatureValue 0x04040000 only stores the value in \_SB.FANL and
     notifies \_SB.VFAN. FANL is used nowhere else: it just selects the
     synthetic RPM (0/2500/3500/4500) that VFAN._FST returns. So it is a
     "fan level" hint from the OS, not a reading.
   - The only real fan data I can find is FLVL at EC offset 0x4A
     (ECF2, EmbeddedControl), which no ACPI method reads.

So unless Mark knows of another interface, I think this model simply
does not report fan RPM through Other Mode, and there is nothing to fix
on the driver side for the fan. For the binding part:

Tested-by: Géza Katona <katona.geza.1@gmail.com>

The full acpidump (MSDM table removed) is attached to this issue:
https://github.com/sergiomelas/lenovo-linux-drivers/issues/24

Thanks,
Géza Katona

2026. 10. 22. 17:45 keltezéssel, Rong Zhang írta:
> Hi Katona,
>
> On Thu, 2026-10-22 at 16:49 +0200, Katona Géza wrote:
>> Hi all,
>>
>> I would like to ask you kind support. On my Lenovo Yoga Pro 9 16IAH10
>> no fan speed is available to Linux at all. I went through the ACPI tables
>> and the in-kernel drivers, and the  only interface that looks usable is
>> Lenovo Other Mode (lenovo-wmi-other), which never completes binding
>> on this machine.
>>
>> Machine (from /sys/class/dmi/id):
>>
>>     sys_vendor:      LENOVO
>>     product_name:    83L0
>>     product_family:  Yoga Pro 9 16IAH10
>>     product_sku:     LENOVO_MT_83L0_BU_idea_FM_Yoga Pro 9 16IAH10
>>     board_name:      LNVNB161216
>>     bios_version:    QVCN50WW (01/28/2026)
>>     CPU / dGPU:      Intel Core Ultra 7 255H (Arrow Lake-H) / RTX 5050
>>     Kernel:          7.2.11-200.fc44.x86_64 (Fedora 44)
>>
>> 1) Lenovo WMI GUIDs present (/sys/bus/wmi/devices):
>>
>>     DC2A8805-3A8C-41BA-A6F7-092E0089CD3B  Other Mode  -> lenovo_wmi_other
>>     362A3AFE-3D96-4665-8530-96DAD5BB300E  CAPABILITY_DATA_00 ->
>> lenovo_wmi_capdata
>>     887B54E3-DDDC-4B2C-8B88-68A26A8835D0  Gamezone -> "platform_profile
>> probe failed"
>>
>>     absent:
>>     7A8F5407-CB67-4D6E-B547-39B3BE018154  CAPABILITY_DATA_01
>>     B642801B-3D21-45DE-90AE-6E86F164FB21  FAN_TEST_DATA
> Could you test
> https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-ilpo-next
> with dynamic debug printks enabled?
>
> It contains a recent series to solve the absence of CAPABILITY_DATA_01.
> To workaround the absence of FAN_TEST_DATA, please also set lenovo-wmi-
> other's module parameters expose_all_fans and relax_fan_constraint to 1.
>
> Please also dump CAPABILITY_DATA_00 with
> /sys/kernel/debug/lenovo_wmi/*/capdata.
>
> As Sergio suggested, an acpidump will also be helpful.
>
> Thanks,
> Rong
>
>>     lwmi_om_master_bind() returns -ENODEV when cd01_list is NULL, so the
>>     component master never binds. As a result there is no
>>     /sys/class/firmware-attributes/lenovo-wmi-other* and no fan hwmon.
>>     The fan code path itself (lwmi_om_fan_info_collect_cd00() and
>>     LWMI_ATTR_ID_FAN_RPM) only needs capdata00, and a missing capdata_fan
>>     is already handled (channels hidden, or exposed read-only with
>>     expose_all_fans=1).
>>
>> 2) Why the other fan drivers cannot work here (from acpidump + iasl):
>>
>>     - yogafan: the machine falls into the generic "Yoga" quirk
>>       (\_SB.PCI0.LPC0.EC0.FANS), but there is no FANS/FA1S/FA2S/FAN0
>>       object anywhere in the DSDT or SSDTs. \_SB.PC00.LPCB.EC0 (LCFC0002)
>>       is an empty stub. The real EC is \_SB.PC00.LPCB.H_EC (SSDT
>>       "CB-01"), and its ECF2 region has no RPM field, only FLVL at 0x4A.
>>     - acpi_fan \_SB.VFAN (PNP0C0B): _FST returns a synthetic RPM table
>>       selected by \_SB.FANL, which is only written through a _DSM call
>>       (FIDS 0x04040000), so it always reads 0 on Linux.
>>     - acpi_fan \_SB.IETM.TFN1 (INTC1063, DPTF): _FST calls
>>       \_SB.PC00.LPCB.H_EC.DPTF.GFNS, which is only declared External and
>>       not defined in any table, so _FST fails (fan1_input -> -ENODEV).
>>     - ITE8 (SIO hwmon with GFNL/GFNH = IT87 fan1 tach regs 0x0D/0x18) is
>>       disabled on this model (_STA 0, ITSI != 1).
>>
>> Questions / request:
>>
>>     a) Could CAPABILITY_DATA_01 be made optional in lwmi_om_master_bind(),
>>        so that the fan HWMON (and the capdata00-only attributes) can bind
>>        on machines that only implement capdata00?
>>     b) Mark: does the Yoga Pro 9 Gen 10 firmware report fan RPM through
>>        Other Mode GetFeatureValue (LWMI_ATTR_ID_FAN_RPM), as Lenovo Vantage
>>        would use on Windows?
>>
>> I can test patches right away, run the module with expose_all_fans=1 and
>> dyndbg, and send the full acpidump if needed.
>>
>> Thanks,
>> Géza Katona

