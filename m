Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDCCE416858;
	Fri, 31 Jul 2026 10:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785493780; cv=none; b=GN08I0LH3Go/oDWeIXgNoxUcSvzcQjrP1gflmZLolNldaLrpj6YctUNLxYrd5PDdtSv926hpgfLVGWZ08fhRBj3uxnROM6WtXDtbd/R8HUYlJbvAGDaX5PrcDOpZFFZkhnGP4G+LZL+46x/d9aHoEPS+THzoBwgxBjLtLToIS5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785493780; c=relaxed/simple;
	bh=+ssec9JwyX/32HtU7a0T8NkOzMjDPZnEXN9iGELb2h4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g0SiWMX8Zzfss+FBTEyEK9YcTfbswQzDz+39BE9tz4rUkR5UbZYMrc8/AdbTzpta+hCsbZl5Td7E51IO+mcgOvyLqUiTpQRIf8V+fpBSNJCuXxeDXluzKpWZ+FS5sx0c0hOJb8ecvpRQftxvot30LjMj4tdbywGa1oYfFbvYnng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=r1rdQ1vS; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="r1rdQ1vS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1785493757; x=1786098557; i=w_armin@gmx.de;
	bh=rCgi7PZnr5wmZP5jB3Q/RdrNgpXkXnCuv4QqoiSnuA8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=r1rdQ1vSq89g//vDoNsEDWOYW1u9kmjnWNTmbXVZV5C4VhclfoO+IxO4ik3atZAx
	 qiyFlMFJ7r8+qUioXChMoLtxmJrcKFMBbAApmAUYatSo1nVsraIMhgJVoo9yBmYMO
	 BPNyk6IDQNMmDZ9nQpzMvykpovnwjOMbWPCBIz2l4D+UsFbfKJVvN76vb6aEcEkVS
	 XlGaq2rqGb5r3qCgFmyOFKNyxO0V3jafvd8+xEtIde1KFdiniqA3XJdFo1nCh4gHi
	 EvZfH6EJj+i3GCfkxpiyPNBJ7kPzwUHAgbw1RvnurphGGKnZD5ejd+BD6fLD51pzQ
	 GxewcIRdt2aGIfKikg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M3DJv-1wmikS0Tdd-00AO7I; Fri, 31
 Jul 2026 12:29:17 +0200
Message-ID: <1428e200-5cf5-4f12-b5a6-1b5a648675ca@gmx.de>
Date: Fri, 31 Jul 2026 12:29:15 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] platform/x86/amd/hsmp: Add HSMP client support for
 Family 1Ah
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Muralidhara M K <muralidhara.mk@amd.com>, ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 muthusamy.ramalingam@amd.com
References: <20260729164034.1331375-1-muralidhara.mk@amd.com>
 <20260729164034.1331375-2-muralidhara.mk@amd.com>
 <5c600f4d-a93a-4410-9183-d33b7f6f4fc3@gmx.de>
 <e9f9ab87-61b1-4fe6-9ab8-e11f65b6d4e7@amd.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <e9f9ab87-61b1-4fe6-9ab8-e11f65b6d4e7@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:8Xhf+TYu+49NJtdGrSVwmUcJflLWOutYjqSeAQIE+uBYPujj16N
 duaoqTfvzMHV76tInabaIOoM3w04WFrfhdMlYhpduyrtVJuWcuAlmEuxtDIM9sYi7XtffM6
 MW8q83LmGov04Z4bwzTVrVJc8UM4oOOBMS6bCZsIAMfoLFf4hE9RP7iHCzwFs4eK/HDh6UA
 3cIadZnMg697hVahs3/sw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:q27hKWw0qcM=;U32/7UbSobXcGxGUsKTBv6XjLcS
 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

Am 31.07.26 um 09:00 schrieb Shyam Sundar S K:

>
> On 30-07-2026 22:13, Armin Wolf wrote:
>> Am 29.07.26 um 18:40 schrieb Muralidhara M K:
>>
>>> Add non-ACPI HSMP mailbox support, Ryzen Master SMC client message
>>> descriptors, and platform routing for the Family 1Ah client platforms:
>>>
>>>  =C2=A0=C2=A0=C2=A0=C2=A0Models 80h-87h=C2=A0=C2=A0=C2=A0 Medusa1
>>>  =C2=A0=C2=A0=C2=A0=C2=A0Models 88h-8Fh=C2=A0=C2=A0=C2=A0 Olympic Ridg=
e
>>>  =C2=A0=C2=A0=C2=A0=C2=A0Models E0h-E3h=C2=A0=C2=A0=C2=A0 Medusa2
>>>
>>> All three share the same client mailbox addresses and message set, so =
a
>>> single is_client_platform() predicate covers them, and the two adjacen=
t
>>> Model 8xh ranges are tested as one.
>>>
>>> The client parts drive a different mailbox from the server HSMP
>>> interface. They expose no _DSD/_CRS to discover the mailbox, so the SM=
N
>>> addresses are fixed in hsmp.h and shared by the platform and ACPI
>>> probes, and they speak the Ryzen Master SMC (RMSMC) message set rather
>>> than the server message IDs. Add that message set and its descriptor
>>> table to the UAPI header.
>>>
>>> Two message descriptor tables now exist, so every lookup has to pick t=
he
>>> one matching the running platform. Rather than test the platform at ea=
ch
>>> lookup, describe the platform once: struct hsmp_plat_desc holds the
>>> mailbox addresses, the descriptor table and its size, and the IDs of t=
he
>>> messages the driver issues itself. get_hsmp_pdev() resolves it, which
>>> both drivers call before they bring any socket up and which runs on a
>>> CPU that is fixed long before either can load. The server descriptor i=
s
>>> also the static initialiser, so the message plumbing cannot reach a NU=
LL
>>> descriptor even if a future caller arrives another way.
>>>
>>> get_msg_desc() then indexes the table behind that pointer, and
>>> validate_message(), is_get_msg(), hsmp_ioctl_msg(), hsmp_test() and
>>> hsmp_cache_proto_ver() read the bound and the message IDs from the
>>> descriptor. get_msg_desc() returns NULL rather than indexing out of
>>> range if a caller skipped the bounds check, and the Spectre v1 clamp i=
n
>>> hsmp_ioctl_msg() uses the running platform's table size.
>>>
>>> In init_platform_device() the mailbox setup becomes a copy of the
>>> descriptor's addresses. The F1Ah M0h message-id offset stays behind
>>> is_f1a_m0h() as an override, because it applies only to this non-ACPI
>>> path while the descriptor is shared with the ACPI one. It cannot distu=
rb
>>> the client mailbox: it requires model <=3D 0x0F and the client models =
are
>>> all >=3D 0x80. The server mailbox addresses move from plat.c to hsmp.h=
 so
>>> both address sets sit with the descriptors that consume them; the valu=
es
>>> are unchanged, written to the same width as the client set they now si=
t
>>> beside.
>>>
>>> Since this is the change that lets the platform driver match the clien=
t
>>> models, it also has to let the client probe survive the interface-vers=
ion
>>> query. Some client SMU builds reject HSMP_CLIENT_GET_INTERFACE_VER wit=
h
>>> "invalid message" even though the mailbox works, as the test message
>>> issued just before it shows, so treat that failure as non-fatal on the
>>> client and register the socket anyway. Nothing on the client depends o=
n
>>> the reported version: hsmp_pdev->proto_ver gates the metrics_bin
>>> attribute and the protocol_version sysfs file, both of which describe
>>> the server interface. The query stays fatal on server parts.
>>>
>>> The client descriptor table carries __attribute__((unused)), matching
>>> hsmp_msg_desc_table[]. Both are defined in a UAPI header that several
>>> translation units include without using the table, so without it
>>> -Wunused-const-variable fires on plat.c, acpi.c and hwmon.c.
>>>
>>> Document the client platforms in Documentation/arch/x86/amd_hsmp.rst,
>>> which until now described HSMP as available only on the EPYC server
>>> parts and MI300A. The character device and ioctl interface are unchang=
ed
>>> there; what differs is the accepted message IDs, so the text points at
>>> the HSMP_CLIENT_* set in the UAPI header.
>> Hi,
>>
>> i am asking myself if there exist a connection between the Ryzen Master=
 SMC
>> message ids and the AMD_ACPI WMI device:
>>
>> [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"), Description("C=
lass to Query/Set a CLKValue"), guid("{95F20B61-3D44-41F8-87E1-03CBF94C4E8=
F}")]
>> class AMD_ACPI {
>>  =C2=A0 [key, read] string InstanceName;
>>  =C2=A0 [read] boolean Active;
>>
>>  =C2=A0 [WmiMethodId(1), Implemented, read, write, Description("Get ver=
sion")] void QueryVersion([out, Description("version")] uint32 version);
>>  =C2=A0 [WmiMethodId(2), Implemented, read, write, Description("WMI fun=
ction init.")] void Init([out, Description("status")] uint8 status);
>>  =C2=A0 [WmiMethodId(3), Implemented, read, write, Description("Get BIO=
S ACPI support function table.")] void GetObjectID([out, Description("Get =
BIOS support Object ID table")] OIDPackage pack);
>>  =C2=A0 [WmiMethodId(4), Implemented, read, write, Description("Bios re=
quest data")] void Getdvalues([in, Description("ID used to identify")] uin=
t32 ID, [out, Description("status")] GetdValuesPackage pack);
>>  =C2=A0 [WmiMethodId(5), Implemented, read, write, Description("Command=
 Run")] void RunCommand([in, Description("In buffer")] uint8 Inbuf[8], [ou=
t, Description("Out buffer")] OutBuffer Outbuf);
>>  =C2=A0 [WmiMethodId(6), Implemented, read, write, Description("Get Min=
/Max/Stepping values")] void GetMinMaxSteppingValues([in, Description("ID =
used to identify")] uint32 ID, [out, Description("status")] GetMinMaxStepp=
ingPackage pack);
>>  =C2=A0 [WmiMethodId(7), Implemented, read, write, Description("Get DIM=
M SPD data")] void GetDimmSpdData([in, Description("DIMM Index")] uint32 I=
ndex, [out, Description("SPD Data Buffer")] DimmSpdBuffer DimmSpdData);
>>  =C2=A0 [WmiMethodId(8), Implemented, read, write, Description("Get BIO=
S ACPI support function table2.")] void GetObjectID2([out, Description("Ge=
t BIOS support Object ID table2")] OIDPackage pack);
>>  =C2=A0 [WmiMethodId(9), Implemented, read, write, Description("Get RMP=
 table")] void GetRmpData([out, Description("Get RMP table")] RMPPackage p=
ack);
>>  =C2=A0 [WmiMethodId(10), Implemented, read, write, Description("Get OP=
P Heaer")] void GetOppTable([out, Description("Get Opp Heaer")] OPPHeader =
pack);
>>  =C2=A0 [WmiMethodId(11), Implemented, read, write, Description("Get OP=
P Data")] void GetOppData([in, Description("Profile Index")] uint32 Index,=
 [out, Description("Opp Profile")] OPPProfole pack);
>> };
>>
>> I own multiple devices with such an interface, and i would _love_ to ad=
d support
>> for them.
> Thanks Armin. WMI stuff was on my TODO for a long time and recently I ha=
ve completed the work, please expect it to get posted next cycle - Shall i=
nclude you to the review once I send out the series.
>
> Thanks,
> Shyam
>  =20

I will gladly participate in the review of those patches.

Thanks,
Armin Wolf

>> Thanks,
>> Armin Wolf
>>
>>> Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
>>> ---
>>>  =C2=A0 Documentation/arch/x86/amd_hsmp.rst=C2=A0 |=C2=A0 18 +++-
>>>  =C2=A0 arch/x86/include/uapi/asm/amd_hsmp.h | 137 +++++++++++++++++++=
++++++++
>>>  =C2=A0 drivers/platform/x86/amd/hsmp/hsmp.c | 125 +++++++++++++++++++=
+----
>>>  =C2=A0 drivers/platform/x86/amd/hsmp/hsmp.h |=C2=A0 73 ++++++++++++++
>>>  =C2=A0 drivers/platform/x86/amd/hsmp/plat.c |=C2=A0 39 ++++----
>>>  =C2=A0 5 files changed, 354 insertions(+), 38 deletions(-)
>>>
>>> diff --git a/Documentation/arch/x86/amd_hsmp.rst b/Documentation/arch/=
x86/amd_hsmp.rst
>>> index fa1fc240e212..8a9d6fe7d4cf 100644
>>> --- a/Documentation/arch/x86/amd_hsmp.rst
>>> +++ b/Documentation/arch/x86/amd_hsmp.rst
>>> @@ -8,6 +8,21 @@ Newer Fam19h(model 0x00-0x1f, 0x30-0x3f, 0x90-0x9f, 0=
xa0-0xaf),
>>>  =C2=A0 Fam1Ah(model 0x00-0x1f) EPYC server line of processors from AM=
D support
>>>  =C2=A0 system management functionality via HSMP (Host System Manageme=
nt Port).
>>>  =C2=A0 +The Fam1Ah client platforms are supported as well:
>>> +
>>> +=C2=A0 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=C2=A0 =3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
>>> +=C2=A0 Model=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Pl=
atform
>>> +=C2=A0 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=C2=A0 =3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
>>> +=C2=A0 0x80-0x87=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Medusa1
>>> +=C2=A0 0x88-0x8f=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Olympic Ridge
>>> +=C2=A0 0xe0-0xe3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Medusa2
>>> +=C2=A0 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=C2=A0 =3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
>>> +
>>> +They share one mailbox and speak the Ryzen Master SMC message set ins=
tead
>>> +of the server HSMP message set, so the message IDs accepted on them a=
re
>>> +the HSMP_CLIENT_* ones listed in arch/x86/include/uapi/asm/amd_hsmp.h=
.
>>> +The character device and ioctl interface described below are the same=
.
>>> +
>>>  =C2=A0 The Host System Management Port (HSMP) is an interface to prov=
ide
>>>  =C2=A0 OS-level software with access to system management functions v=
ia a
>>>  =C2=A0 set of mailbox registers.
>>> @@ -17,7 +32,8 @@ More details on the interface can be found in chapte=
r
>>>  =C2=A0 Eg: https://docs.amd.com/v/u/en-US/55898_B1_pub_0_50
>>>  =C2=A0 =C2=A0 -HSMP interface is supported on EPYC line of server CPU=
s and MI300A (APU).
>>> +HSMP interface is supported on EPYC line of server CPUs, MI300A (APU)=
 and
>>> +the Fam1Ah client platforms listed above.
>>>  =C2=A0 =C2=A0 =C2=A0 HSMP device
>>> diff --git a/arch/x86/include/uapi/asm/amd_hsmp.h b/arch/x86/include/u=
api/asm/amd_hsmp.h
>>> index eda336bfd3e9..b4c3ddb9d1c1 100644
>>> --- a/arch/x86/include/uapi/asm/amd_hsmp.h
>>> +++ b/arch/x86/include/uapi/asm/amd_hsmp.h
>>> @@ -664,4 +664,141 @@ struct hsmp_telemetry_data {
>>>  =C2=A0 #define HSMP_IOCTL_GET_TELEMETRY_DATA \
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 _IOW(HSMP_BASE_IOCTL_NR, 1, struct hsm=
p_telemetry_data)
>>>  =C2=A0 +/*
>>> + * Client HSMP messages supported on the Family 1Ah client platforms:
>>> + * Models 80h-87h (Medusa1), Models 88h-8Fh (Olympic Ridge) and
>>> + * Models E0h-E3h (Medusa2).
>>> + * These map to Ryzen Master SMC (RMSMC) message IDs.
>>> + */
>>> +enum hsmp_client_message_ids {
>>> +=C2=A0=C2=A0=C2=A0 HSMP_CLIENT_TEST =3D 1,=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* 01h Test message */
>>> +=C2=A0=C2=A0=C2=A0 HSMP_CLIENT_GET_SMU_VER,=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 /* 02h SMU FW version */
>>> +=C2=A0=C2=A0=C2=A0 HSMP_CLIENT_GET_INTERFACE_VER,=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 /* 03h Interface version */
>>> +=C2=A0=C2=A0=C2=A0 HSMP_CLIENT_GET_METRICS_TABLE_VER,=C2=A0=C2=A0=C2=
=A0 /* 04h Metrics table version */
>>> +=C2=A0=C2=A0=C2=A0 HSMP_CLIENT_GET_METRICS_TABLE,=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 /* 05h Metrics table log sample */
>>> +=C2=A0=C2=A0=C2=A0 HSMP_CLIENT_GET_METRICS_TABLE_DRAM_ADDR,/* 06h Met=
rics table DRAM address */
>>> +=C2=A0=C2=A0=C2=A0 HSMP_CLIENT_SET_CORE_PSM_MARGIN,=C2=A0=C2=A0=C2=A0=
 /* 07h Set core PSM margin */
>>> +=C2=A0=C2=A0=C2=A0 HSMP_CLIENT_SET_ALL_CORE_PSM_MARGIN,=C2=A0=C2=A0=
=C2=A0 /* 08h Set all core PSM margin */
>>> +=C2=A0=C2=A0=C2=A0 HSMP_CLIENT_SET_FAST_PPT_LIMIT,=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 /* 09h Set fast PPT limit */
>>> +=C2=A0=C2=A0=C2=A0 HSMP_CLIENT_SET_VRM_VDD_CURRENT_LIMIT,=C2=A0=C2=A0=
=C2=A0 /* 0Ah Set VRM VDD current limit */
>>> +=C2=A0=C2=A0=C2=A0 HSMP_CLIENT_SET_VRM_VDD_MAX_CURRENT_LIMIT,/* 0Bh S=
et VRM VDD max current limit */
>>> +=C2=A0=C2=A0=C2=A0 HSMP_CLIENT_SET_TJ_MAX,=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* 0Ch Set TjMax */
>>> +=C2=A0=C2=A0=C2=A0 HSMP_CLIENT_SET_FIT_LIMIT_SCALAR,=C2=A0=C2=A0=C2=
=A0 /* 0Dh Set FIT limit scalar */
>>> +=C2=A0=C2=A0=C2=A0 HSMP_CLIENT_ENABLE_OVERCLOCKING,=C2=A0=C2=A0=C2=A0=
 /* 0Eh Enable overclocking */
>>> +=C2=A0=C2=A0=C2=A0 HSMP_CLIENT_DISABLE_OVERCLOCKING,=C2=A0=C2=A0=C2=
=A0 /* 0Fh Disable overclocking */
>>> +=C2=A0=C2=A0=C2=A0 HSMP_CLIENT_SET_OVERCLOCK_FREQ_ALL_CORES,/* 10h Se=
t OC freq all cores */
>>> +=C2=A0=C2=A0=C2=A0 HSMP_CLIENT_SET_OVERCLOCK_FREQ_PER_CORE,/* 11h Set=
 OC freq per core */
>>> +=C2=A0=C2=A0=C2=A0 HSMP_CLIENT_SET_OVERCLOCK_VID,=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 /* 12h Set OC VID */
>>> +=C2=A0=C2=A0=C2=A0 HSMP_CLIENT_SET_FCLK_OVERCLOCK_ON_THE_FLY,/* 13h S=
et FCLK OC on-the-fly */
>>> +=C2=A0=C2=A0=C2=A0 HSMP_CLIENT_GET_CORE_PERF_ORDER,=C2=A0=C2=A0=C2=A0=
 /* 14h Get core performance order */
>>> +=C2=A0=C2=A0=C2=A0 HSMP_CLIENT_SET_SUSTAINED_POWER_LIMIT,=C2=A0=C2=A0=
=C2=A0 /* 15h Set sustained power limit */
>>> +=C2=A0=C2=A0=C2=A0 HSMP_CLIENT_SET_SLOW_PPT_LIMIT,=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 /* 16h Set slow PPT limit */
>>> +=C2=A0=C2=A0=C2=A0 HSMP_CLIENT_SET_VRM_GFX_MAX_CURRENT_LIMIT,/* 17h S=
et VRM GFX max current limit */
>>> +=C2=A0=C2=A0=C2=A0 HSMP_CLIENT_SET_VRM_SOC_CURRENT_LIMIT,=C2=A0=C2=A0=
=C2=A0 /* 18h Set VRM SOC current limit */
>>> +=C2=A0=C2=A0=C2=A0 HSMP_CLIENT_SET_FAST_SPM_LIMIT,=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 /* 19h Set fast SPM limit */
>>> +=C2=A0=C2=A0=C2=A0 HSMP_CLIENT_SET_SLOW_SPM_LIMIT,=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 /* 1Ah Set slow SPM limit */
>>> +=C2=A0=C2=A0=C2=A0 HSMP_CLIENT_GET_CORE_PSM_MARGIN,=C2=A0=C2=A0=C2=A0=
 /* 1Bh Get core PSM margin */
>>> +=C2=A0=C2=A0=C2=A0 HSMP_CLIENT_GET_GFX_PSM_MARGIN,=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 /* 1Ch Get GFX PSM margin */
>>> +=C2=A0=C2=A0=C2=A0 HSMP_CLIENT_SPARE_0X1D,=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* 1Dh Spare */
>>> +=C2=A0=C2=A0=C2=A0 HSMP_CLIENT_SPARE_0X1E,=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* 1Eh Spare */
>>> +=C2=A0=C2=A0=C2=A0 HSMP_CLIENT_SPARE_0X1F,=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* 1Fh Spare */
>>> +=C2=A0=C2=A0=C2=A0 HSMP_CLIENT_SPARE_0X20,=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* 20h Spare */
>>> +=C2=A0=C2=A0=C2=A0 HSMP_CLIENT_SET_GFXCLK_OVERDRIVE_BY_FREQ_VID,/* 21=
h Set GfxClk overdrive by freq/VID */
>>> +=C2=A0=C2=A0=C2=A0 HSMP_CLIENT_DISABLE_GFXCLK_OVERDRIVE,=C2=A0=C2=A0=
=C2=A0 /* 22h Disable GfxClk overdrive */
>>> +=C2=A0=C2=A0=C2=A0 HSMP_CLIENT_SET_GFX_PSM_MARGIN,=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 /* 23h Set GFX PSM margin */
>>> +=C2=A0=C2=A0=C2=A0 HSMP_CLIENT_SET_CCLK_FMAX_OFFSET,=C2=A0=C2=A0=C2=
=A0 /* 24h Set CCLK Fmax offset */
>>> +=C2=A0=C2=A0=C2=A0 HSMP_CLIENT_SET_CORE_POWER_LIMIT_OFFSET,/* 25h Set=
 core power limit offset */
>>> +=C2=A0=C2=A0=C2=A0 HSMP_CLIENT_ADD_EXTRA_PSM_GUARDBAND,=C2=A0=C2=A0=
=C2=A0 /* 26h Add extra PSM guardband */
>>> +=C2=A0=C2=A0=C2=A0 HSMP_CLIENT_ADD_EXTRA_PSM_GUARDBAND_GFX,/* 27h Add=
 extra PSM guardband GFX */
>>> +=C2=A0=C2=A0=C2=A0 HSMP_CLIENT_SET_GFXCLK_FMAX,=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 /* 28h Set GfxClk Fmax */
>>> +=C2=A0=C2=A0=C2=A0 HSMP_CLIENT_MSG_ID_MAX,
>>> +};
>>> +
>>> +/* Client message descriptor table (Family 1Ah Models 80h-8Fh, E0h-E3=
h) */
>>> +static const struct hsmp_msg_desc hsmp_client_msg_desc_table[]
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 __attribute__((unused)) =3D {
>>> +=C2=A0=C2=A0=C2=A0 /* RESERVED */
>>> +=C2=A0=C2=A0=C2=A0 {0, 0, HSMP_RSVD},
>>> +=C2=A0=C2=A0=C2=A0 /* HSMP_CLIENT_TEST */
>>> +=C2=A0=C2=A0=C2=A0 {1, 1, HSMP_GET},
>>> +=C2=A0=C2=A0=C2=A0 /* HSMP_CLIENT_GET_SMU_VER */
>>> +=C2=A0=C2=A0=C2=A0 {0, 1, HSMP_GET},
>>> +=C2=A0=C2=A0=C2=A0 /* HSMP_CLIENT_GET_INTERFACE_VER */
>>> +=C2=A0=C2=A0=C2=A0 {0, 1, HSMP_GET},
>>> +=C2=A0=C2=A0=C2=A0 /* HSMP_CLIENT_GET_METRICS_TABLE_VER */
>>> +=C2=A0=C2=A0=C2=A0 {0, 1, HSMP_GET},
>>> +=C2=A0=C2=A0=C2=A0 /* HSMP_CLIENT_GET_METRICS_TABLE */
>>> +=C2=A0=C2=A0=C2=A0 {0, 0, HSMP_GET},
>>> +=C2=A0=C2=A0=C2=A0 /* HSMP_CLIENT_GET_METRICS_TABLE_DRAM_ADDR */
>>> +=C2=A0=C2=A0=C2=A0 {0, 3, HSMP_GET},
>>> +=C2=A0=C2=A0=C2=A0 /* HSMP_CLIENT_SET_CORE_PSM_MARGIN */
>>> +=C2=A0=C2=A0=C2=A0 {1, 0, HSMP_SET},
>>> +=C2=A0=C2=A0=C2=A0 /* HSMP_CLIENT_SET_ALL_CORE_PSM_MARGIN */
>>> +=C2=A0=C2=A0=C2=A0 {1, 0, HSMP_SET},
>>> +=C2=A0=C2=A0=C2=A0 /* HSMP_CLIENT_SET_FAST_PPT_LIMIT */
>>> +=C2=A0=C2=A0=C2=A0 {1, 0, HSMP_SET},
>>> +=C2=A0=C2=A0=C2=A0 /* HSMP_CLIENT_SET_VRM_VDD_CURRENT_LIMIT */
>>> +=C2=A0=C2=A0=C2=A0 {1, 0, HSMP_SET},
>>> +=C2=A0=C2=A0=C2=A0 /* HSMP_CLIENT_SET_VRM_VDD_MAX_CURRENT_LIMIT */
>>> +=C2=A0=C2=A0=C2=A0 {1, 0, HSMP_SET},
>>> +=C2=A0=C2=A0=C2=A0 /* HSMP_CLIENT_SET_TJ_MAX */
>>> +=C2=A0=C2=A0=C2=A0 {1, 0, HSMP_SET},
>>> +=C2=A0=C2=A0=C2=A0 /* HSMP_CLIENT_SET_FIT_LIMIT_SCALAR */
>>> +=C2=A0=C2=A0=C2=A0 {1, 0, HSMP_SET},
>>> +=C2=A0=C2=A0=C2=A0 /* HSMP_CLIENT_ENABLE_OVERCLOCKING */
>>> +=C2=A0=C2=A0=C2=A0 {0, 0, HSMP_SET},
>>> +=C2=A0=C2=A0=C2=A0 /* HSMP_CLIENT_DISABLE_OVERCLOCKING */
>>> +=C2=A0=C2=A0=C2=A0 {0, 0, HSMP_SET},
>>> +=C2=A0=C2=A0=C2=A0 /* HSMP_CLIENT_SET_OVERCLOCK_FREQ_ALL_CORES */
>>> +=C2=A0=C2=A0=C2=A0 {1, 0, HSMP_SET},
>>> +=C2=A0=C2=A0=C2=A0 /* HSMP_CLIENT_SET_OVERCLOCK_FREQ_PER_CORE */
>>> +=C2=A0=C2=A0=C2=A0 {1, 0, HSMP_SET},
>>> +=C2=A0=C2=A0=C2=A0 /* HSMP_CLIENT_SET_OVERCLOCK_VID */
>>> +=C2=A0=C2=A0=C2=A0 {1, 0, HSMP_SET},
>>> +=C2=A0=C2=A0=C2=A0 /* HSMP_CLIENT_SET_FCLK_OVERCLOCK_ON_THE_FLY */
>>> +=C2=A0=C2=A0=C2=A0 {1, 0, HSMP_SET},
>>> +=C2=A0=C2=A0=C2=A0 /* HSMP_CLIENT_GET_CORE_PERF_ORDER */
>>> +=C2=A0=C2=A0=C2=A0 {1, 1, HSMP_GET},
>>> +=C2=A0=C2=A0=C2=A0 /* HSMP_CLIENT_SET_SUSTAINED_POWER_LIMIT */
>>> +=C2=A0=C2=A0=C2=A0 {1, 0, HSMP_SET},
>>> +=C2=A0=C2=A0=C2=A0 /* HSMP_CLIENT_SET_SLOW_PPT_LIMIT */
>>> +=C2=A0=C2=A0=C2=A0 {1, 0, HSMP_SET},
>>> +=C2=A0=C2=A0=C2=A0 /* HSMP_CLIENT_SET_VRM_GFX_MAX_CURRENT_LIMIT */
>>> +=C2=A0=C2=A0=C2=A0 {1, 0, HSMP_SET},
>>> +=C2=A0=C2=A0=C2=A0 /* HSMP_CLIENT_SET_VRM_SOC_CURRENT_LIMIT */
>>> +=C2=A0=C2=A0=C2=A0 {1, 0, HSMP_SET},
>>> +=C2=A0=C2=A0=C2=A0 /* HSMP_CLIENT_SET_FAST_SPM_LIMIT */
>>> +=C2=A0=C2=A0=C2=A0 {1, 0, HSMP_SET},
>>> +=C2=A0=C2=A0=C2=A0 /* HSMP_CLIENT_SET_SLOW_SPM_LIMIT */
>>> +=C2=A0=C2=A0=C2=A0 {1, 0, HSMP_SET},
>>> +=C2=A0=C2=A0=C2=A0 /* HSMP_CLIENT_GET_CORE_PSM_MARGIN */
>>> +=C2=A0=C2=A0=C2=A0 {1, 1, HSMP_GET},
>>> +=C2=A0=C2=A0=C2=A0 /* HSMP_CLIENT_GET_GFX_PSM_MARGIN */
>>> +=C2=A0=C2=A0=C2=A0 {0, 1, HSMP_GET},
>>> +=C2=A0=C2=A0=C2=A0 /* HSMP_CLIENT_SPARE_0X1D */
>>> +=C2=A0=C2=A0=C2=A0 {0, 0, HSMP_RSVD},
>>> +=C2=A0=C2=A0=C2=A0 /* HSMP_CLIENT_SPARE_0X1E */
>>> +=C2=A0=C2=A0=C2=A0 {0, 0, HSMP_RSVD},
>>> +=C2=A0=C2=A0=C2=A0 /* HSMP_CLIENT_SPARE_0X1F */
>>> +=C2=A0=C2=A0=C2=A0 {0, 0, HSMP_RSVD},
>>> +=C2=A0=C2=A0=C2=A0 /* HSMP_CLIENT_SPARE_0X20 */
>>> +=C2=A0=C2=A0=C2=A0 {0, 0, HSMP_RSVD},
>>> +=C2=A0=C2=A0=C2=A0 /* HSMP_CLIENT_SET_GFXCLK_OVERDRIVE_BY_FREQ_VID */
>>> +=C2=A0=C2=A0=C2=A0 {1, 0, HSMP_SET},
>>> +=C2=A0=C2=A0=C2=A0 /* HSMP_CLIENT_DISABLE_GFXCLK_OVERDRIVE */
>>> +=C2=A0=C2=A0=C2=A0 {0, 0, HSMP_SET},
>>> +=C2=A0=C2=A0=C2=A0 /* HSMP_CLIENT_SET_GFX_PSM_MARGIN */
>>> +=C2=A0=C2=A0=C2=A0 {1, 0, HSMP_SET},
>>> +=C2=A0=C2=A0=C2=A0 /* HSMP_CLIENT_SET_CCLK_FMAX_OFFSET */
>>> +=C2=A0=C2=A0=C2=A0 {1, 0, HSMP_SET},
>>> +=C2=A0=C2=A0=C2=A0 /* HSMP_CLIENT_SET_CORE_POWER_LIMIT_OFFSET */
>>> +=C2=A0=C2=A0=C2=A0 {1, 0, HSMP_SET},
>>> +=C2=A0=C2=A0=C2=A0 /* HSMP_CLIENT_ADD_EXTRA_PSM_GUARDBAND */
>>> +=C2=A0=C2=A0=C2=A0 {1, 0, HSMP_SET},
>>> +=C2=A0=C2=A0=C2=A0 /* HSMP_CLIENT_ADD_EXTRA_PSM_GUARDBAND_GFX */
>>> +=C2=A0=C2=A0=C2=A0 {1, 0, HSMP_SET},
>>> +=C2=A0=C2=A0=C2=A0 /* HSMP_CLIENT_SET_GFXCLK_FMAX */
>>> +=C2=A0=C2=A0=C2=A0 {1, 0, HSMP_SET},
>>> +};
>>> +
>>>  =C2=A0 #endif /*_ASM_X86_AMD_HSMP_H_*/
>>> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x=
86/amd/hsmp/hsmp.c
>>> index 5e123a4ecea9..9b65dbd47965 100644
>>> --- a/drivers/platform/x86/amd/hsmp/hsmp.c
>>> +++ b/drivers/platform/x86/amd/hsmp/hsmp.c
>>> @@ -45,7 +45,67 @@
>>>  =C2=A0=C2=A0 */
>>>  =C2=A0 #define CHECK_GET_BIT=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 BIT(31)
>>>  =C2=A0 -static struct hsmp_plat_device hsmp_pdev;
>>> +static const struct hsmp_mbaddr_info hsmp_mbinfo_server =3D {
>>> +=C2=A0=C2=A0=C2=A0 .base_addr=C2=A0=C2=A0=C2=A0 =3D SMN_HSMP_BASE,
>>> +=C2=A0=C2=A0=C2=A0 .msg_id_off=C2=A0=C2=A0=C2=A0 =3D SMN_HSMP_MSG_ID,
>>> +=C2=A0=C2=A0=C2=A0 .msg_resp_off=C2=A0=C2=A0=C2=A0 =3D SMN_HSMP_MSG_R=
ESP,
>>> +=C2=A0=C2=A0=C2=A0 .msg_arg_off=C2=A0=C2=A0=C2=A0 =3D SMN_HSMP_MSG_DA=
TA,
>>> +};
>>> +
>>> +/* RM: Ryzen Master, the SMC interface these client addresses belong =
to */
>>> +static const struct hsmp_mbaddr_info hsmp_mbinfo_client =3D {
>>> +=C2=A0=C2=A0=C2=A0 .base_addr=C2=A0=C2=A0=C2=A0 =3D SMN_HSMP_BASE_RM,
>>> +=C2=A0=C2=A0=C2=A0 .msg_id_off=C2=A0=C2=A0=C2=A0 =3D SMN_HSMP_MSG_ID_=
RM,
>>> +=C2=A0=C2=A0=C2=A0 .msg_resp_off=C2=A0=C2=A0=C2=A0 =3D SMN_HSMP_MSG_R=
ESP_RM,
>>> +=C2=A0=C2=A0=C2=A0 .msg_arg_off=C2=A0=C2=A0=C2=A0 =3D SMN_HSMP_MSG_DA=
TA_RM,
>>> +};
>>> +
>>> +/*
>>> + * The descriptors carry only the message IDs the driver issues itsel=
f, which
>>> + * are also the only ones the two message sets have in common.=C2=A0 =
Messages named
>>> + * by userspace in an ioctl need no entry here, as that path already =
resolves
>>> + * the ID against the running platform's table.
>>> + */
>>> +static const struct hsmp_plat_desc hsmp_desc_server =3D {
>>> +=C2=A0=C2=A0=C2=A0 .mbinfo=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 =3D &hsmp_mbinfo_server,
>>> +=C2=A0=C2=A0=C2=A0 .msg_desc=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 =3D hsmp_msg_desc_table,
>>> +=C2=A0=C2=A0=C2=A0 .num_msgs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 =3D HSMP_MSG_ID_MAX,
>>> +=C2=A0=C2=A0=C2=A0 .test_msg=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 =3D HSMP_TEST,
>>> +=C2=A0=C2=A0=C2=A0 .proto_ver_msg=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 =3D HSMP_GET_PROTO_VER,
>>> +};
>>> +
>>> +/* The client drives a different mailbox with the Ryzen Master SMC me=
ssage set */
>>> +static const struct hsmp_plat_desc hsmp_desc_client =3D {
>>> +=C2=A0=C2=A0=C2=A0 .mbinfo=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 =3D &hsmp_mbinfo_client,
>>> +=C2=A0=C2=A0=C2=A0 .msg_desc=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 =3D hsmp_client_msg_desc_table,
>>> +=C2=A0=C2=A0=C2=A0 .num_msgs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 =3D HSMP_CLIENT_MSG_ID_MAX,
>>> +=C2=A0=C2=A0=C2=A0 .test_msg=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 =3D HSMP_CLIENT_TEST,
>>> +=C2=A0=C2=A0=C2=A0 .proto_ver_msg=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 =3D HSMP_CLIENT_GET_INTERFACE_VER,
>>> +};
>>> +
>>> +static struct hsmp_plat_device hsmp_pdev =3D {
>>> +=C2=A0=C2=A0=C2=A0 /*
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * Overridden for the client in get_hsmp_pdev=
(), which every driver
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * calls before it touches a socket.=C2=A0 De=
faulting it here rather than
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * leaving it NULL keeps the message plumbing=
 safe for any caller that
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * arrives without going through there.
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 */
>>> +=C2=A0=C2=A0=C2=A0 .desc =3D &hsmp_desc_server,
>>> +};
>>> +
>>> +/*
>>> + * Callers must bounds-check msg_id against desc->num_msgs first; thi=
s returns
>>> + * NULL rather than indexing out of range if they did not.
>>> + */
>>> +static inline const struct hsmp_msg_desc *get_msg_desc(u32 msg_id)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 const struct hsmp_plat_desc *desc =3D hsmp_pdev.de=
sc;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 if (msg_id >=3D desc->num_msgs)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return NULL;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 return &desc->msg_desc[msg_id];
>>> +}
>>>  =C2=A0 =C2=A0 /*
>>>  =C2=A0=C2=A0 * Gates the AMD HSMP data plane against socket bring-up =
and teardown.
>>> @@ -184,30 +244,37 @@ static int __hsmp_send_message(struct hsmp_socke=
t *sock, struct hsmp_message *ms
>>>  =C2=A0 =C2=A0 static int validate_message(struct hsmp_message *msg)
>>>  =C2=A0 {
>>> +=C2=A0=C2=A0=C2=A0 const struct hsmp_msg_desc *desc;
>>> +
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* msg_id against valid range of messa=
ge IDs */
>>> -=C2=A0=C2=A0=C2=A0 if (msg->msg_id < HSMP_TEST || msg->msg_id >=3D HS=
MP_MSG_ID_MAX)
>>> +=C2=A0=C2=A0=C2=A0 if (msg->msg_id < hsmp_pdev.desc->test_msg ||
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 msg->msg_id >=3D hsmp_pdev=
.desc->num_msgs)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -ENOMSG;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 desc =3D get_msg_desc(msg->msg_id);
>>> +=C2=A0=C2=A0=C2=A0 if (!desc)
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -ENOMSG=
;
>>>  =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* msg_id is a reserved message=
 ID */
>>> -=C2=A0=C2=A0=C2=A0 if (hsmp_msg_desc_table[msg->msg_id].type =3D=3D H=
SMP_RSVD)
>>> +=C2=A0=C2=A0=C2=A0 if (desc->type =3D=3D HSMP_RSVD)
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -ENOMSG=
;
>>>  =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * num_args passed by user should=
 match the num_args specified in
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * message description table.
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>>> -=C2=A0=C2=A0=C2=A0 if (msg->num_args !=3D hsmp_msg_desc_table[msg->ms=
g_id].num_args)
>>> +=C2=A0=C2=A0=C2=A0 if (msg->num_args !=3D desc->num_args)
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EINVAL=
;
>>>  =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * As the HSMP protocol evolves, =
newer platforms may define more
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * response arguments for existin=
g messages.=C2=A0 Use an upper-bound
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * check so that older userspace =
callers requesting fewer response
>>> -=C2=A0=C2=A0=C2=A0=C2=A0 * words than what the current hsmp_msg_desc_=
table[] defines are
>>> -=C2=A0=C2=A0=C2=A0=C2=A0 * still accepted, while rejecting requests t=
hat exceed the
>>> -=C2=A0=C2=A0=C2=A0=C2=A0 * hardware capability.
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * words than what the current descriptor tab=
le defines are still
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * accepted, while rejecting requests that ex=
ceed the hardware
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * capability.
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>>> -=C2=A0=C2=A0=C2=A0 if (msg->response_sz > hsmp_msg_desc_table[msg->ms=
g_id].response_sz)
>>> +=C2=A0=C2=A0=C2=A0 if (msg->response_sz > desc->response_sz)
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EINVAL=
;
>>>  =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>>> @@ -316,7 +383,7 @@ int hsmp_test(u16 sock_ind, u32 value)
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Test the hsmp port by performi=
ng TEST command. The test message
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * takes one argument and returns=
 the value of that argument + 1.
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>>> -=C2=A0=C2=A0=C2=A0 msg.msg_id=C2=A0=C2=A0=C2=A0 =3D HSMP_TEST;
>>> +=C2=A0=C2=A0=C2=A0 msg.msg_id=C2=A0=C2=A0=C2=A0 =3D hsmp_pdev.desc->t=
est_msg;
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 msg.num_args=C2=A0=C2=A0=C2=A0 =3D 1;
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 msg.response_sz=C2=A0=C2=A0=C2=A0 =3D =
1;
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 msg.args[0]=C2=A0=C2=A0=C2=A0 =3D valu=
e;
>>> @@ -340,10 +407,15 @@ EXPORT_SYMBOL_NS_GPL(hsmp_test, "AMD_HSMP");
>>>  =C2=A0 =C2=A0 static bool is_get_msg(struct hsmp_message *msg)
>>>  =C2=A0 {
>>> -=C2=A0=C2=A0=C2=A0 if (hsmp_msg_desc_table[msg->msg_id].type =3D=3D H=
SMP_GET)
>>> +=C2=A0=C2=A0=C2=A0 const struct hsmp_msg_desc *desc =3D get_msg_desc(=
msg->msg_id);
>>> +
>>> +=C2=A0=C2=A0=C2=A0 if (!desc)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return false;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 if (desc->type =3D=3D HSMP_GET)
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return true;
>>>  =C2=A0 -=C2=A0=C2=A0=C2=A0 if (hsmp_msg_desc_table[msg->msg_id].type =
=3D=3D HSMP_SET_GET &&
>>> +=C2=A0=C2=A0=C2=A0 if (desc->type =3D=3D HSMP_SET_GET &&
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (msg->args[0] =
& CHECK_GET_BIT))
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return true;
>>>  =C2=A0 @@ -354,6 +426,7 @@ static long hsmp_ioctl_msg(struct file *fp=
, unsigned long arg)
>>>  =C2=A0 {
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int __user *arguser =3D (int=C2=A0 __u=
ser *)arg;
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct hsmp_message msg =3D { 0 };
>>> +=C2=A0=C2=A0=C2=A0 const struct hsmp_msg_desc *desc;
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int ret;
>>>  =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (copy_struct_from_user(&msg,=
 sizeof(msg), arguser, sizeof(struct hsmp_message)))
>>> @@ -361,23 +434,28 @@ static long hsmp_ioctl_msg(struct file *fp, unsi=
gned long arg)
>>>  =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Check msg_id is within the ran=
ge of supported msg ids
>>> -=C2=A0=C2=A0=C2=A0=C2=A0 * i.e within the array bounds of hsmp_msg_de=
sc_table
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * i.e within the array bounds of the platfor=
m's descriptor table
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>>> -=C2=A0=C2=A0=C2=A0 if (msg.msg_id < HSMP_TEST || msg.msg_id >=3D HSMP=
_MSG_ID_MAX)
>>> +=C2=A0=C2=A0=C2=A0 if (msg.msg_id < hsmp_pdev.desc->test_msg ||
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 msg.msg_id >=3D hsmp_pdev.=
desc->num_msgs)
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -ENOMSG=
;
>>>  =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Sanitize the user-controlled m=
sg_id against speculative
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * execution.=C2=A0 The bounds ch=
eck above retires the out-of-range
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * case with -ENOMSG, but a mispr=
edicted branch can still let the
>>> -=C2=A0=C2=A0=C2=A0=C2=A0 * CPU speculatively use msg_id as an index i=
nto
>>> -=C2=A0=C2=A0=C2=A0=C2=A0 * hsmp_msg_desc_table[] (here and in validat=
e_message() /
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * CPU speculatively use msg_id as an index i=
nto the message
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * descriptor tables (here and in validate_me=
ssage() /
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * is_get_msg() called downstream=
 via hsmp_send_message()), and
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * pull arbitrary kernel memory i=
nto the cache (Spectre v1,
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * CVE-2017-5753).=C2=A0 Clamp on=
ce into msg.msg_id so every downstream
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * dereference sees the sanitized=
 value.
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>>> -=C2=A0=C2=A0=C2=A0 msg.msg_id =3D array_index_nospec(msg.msg_id, HSMP=
_MSG_ID_MAX);
>>> +=C2=A0=C2=A0=C2=A0 msg.msg_id =3D array_index_nospec(msg.msg_id, hsmp=
_pdev.desc->num_msgs);
>>> +
>>> +=C2=A0=C2=A0=C2=A0 desc =3D get_msg_desc(msg.msg_id);
>>> +=C2=A0=C2=A0=C2=A0 if (!desc || desc->type =3D=3D HSMP_RSVD)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -ENOMSG;
>>>  =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 switch (fp->f_mode & (FMODE_WRI=
TE | FMODE_READ)) {
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case FMODE_WRITE:
>>> @@ -410,7 +488,7 @@ static long hsmp_ioctl_msg(struct file *fp, unsign=
ed long arg)
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret)
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>>>  =C2=A0 -=C2=A0=C2=A0=C2=A0 if (hsmp_msg_desc_table[msg.msg_id].respon=
se_sz > 0) {
>>> +=C2=A0=C2=A0=C2=A0 if (desc->response_sz > 0) {
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Copy result=
s back to user for get/monitor commands */
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (copy_to_us=
er(arguser, &msg, sizeof(struct hsmp_message)))
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 return -EFAULT;
>>> @@ -687,9 +765,9 @@ int hsmp_cache_proto_ver(u16 sock_ind)
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct hsmp_message msg =3D { 0 };
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int ret;
>>>  =C2=A0 -=C2=A0=C2=A0=C2=A0 msg.msg_id=C2=A0=C2=A0=C2=A0 =3D HSMP_GET_=
PROTO_VER;
>>> +=C2=A0=C2=A0=C2=A0 msg.msg_id=C2=A0=C2=A0=C2=A0 =3D hsmp_pdev.desc->p=
roto_ver_msg;
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 msg.sock_ind=C2=A0=C2=A0=C2=A0 =3D soc=
k_ind;
>>> -=C2=A0=C2=A0=C2=A0 msg.response_sz =3D hsmp_msg_desc_table[HSMP_GET_P=
ROTO_VER].response_sz;
>>> +=C2=A0=C2=A0=C2=A0 msg.response_sz=C2=A0=C2=A0=C2=A0 =3D get_msg_desc=
(msg.msg_id)->response_sz;
>>>  =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D hsmp_send_message_locke=
d(&msg);
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!ret)
>>> @@ -735,6 +813,15 @@ EXPORT_SYMBOL_NS_GPL(hsmp_misc_deregister, "AMD_H=
SMP");
>>>  =C2=A0 =C2=A0 struct hsmp_plat_device *get_hsmp_pdev(void)
>>>  =C2=A0 {
>>> +=C2=A0=C2=A0=C2=A0 /*
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * Both drivers call this before they bring a=
ny socket up, and the CPU
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * this selects on is fixed long before eithe=
r can load, so resolving
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * the platform description here is enough to=
 have it in place for
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * every mailbox access and for the probe pat=
hs themselves.
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 */
>>> +=C2=A0=C2=A0=C2=A0 if (is_client_platform())
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hsmp_pdev.desc =3D &hsmp_d=
esc_client;
>>> +
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return &hsmp_pdev;
>>>  =C2=A0 }
>>>  =C2=A0 EXPORT_SYMBOL_NS_GPL(get_hsmp_pdev, "AMD_HSMP");
>>> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x=
86/amd/hsmp/hsmp.h
>>> index 8dbff16a87b1..b4bd9800dee1 100644
>>> --- a/drivers/platform/x86/amd/hsmp/hsmp.h
>>> +++ b/drivers/platform/x86/amd/hsmp/hsmp.h
>>> @@ -10,6 +10,8 @@
>>>  =C2=A0 #ifndef HSMP_H
>>>  =C2=A0 #define HSMP_H
>>>  =C2=A0 +#include <asm/amd/hsmp.h>
>>> +
>>>  =C2=A0 #include <linux/compiler_types.h>
>>>  =C2=A0 #include <linux/device.h>
>>>  =C2=A0 #include <linux/hwmon.h>
>>> @@ -17,6 +19,7 @@
>>>  =C2=A0 #include <linux/miscdevice.h>
>>>  =C2=A0 #include <linux/mutex.h>
>>>  =C2=A0 #include <linux/pci.h>
>>> +#include <linux/processor.h>
>>>  =C2=A0 #include <linux/rwsem.h>
>>>  =C2=A0 #include <linux/semaphore.h>
>>>  =C2=A0 #include <linux/sysfs.h>
>>> @@ -32,6 +35,51 @@
>>>  =C2=A0 =C2=A0 #define DRIVER_VERSION=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 "2.6"
>>>  =C2=A0 +/*
>>> + * To access a specific HSMP mailbox register, s/w writes the SMN add=
ress of the
>>> + * HSMP mailbox register into the SMN_INDEX register, and reads/write=
s the
>>> + * SMN_DATA reg.=C2=A0 Below are the SMN addresses of the HSMP mailbo=
x registers in
>>> + * SMU address space, as consumed by the fixed mailbox descriptors in=
 hsmp.c.
>>> + *
>>> + * The server set is used by the non-ACPI path only; the ACPI path di=
scovers the
>>> + * equivalent values from _CRS/_DSD.=C2=A0 The _RM set is the client =
one, named for
>>> + * the Ryzen Master SMC (RMSMC) interface whose mailbox it addresses,=
 and is
>>> + * used by both paths because the client exposes no _CRS/_DSD to disc=
over them
>>> + * from.=C2=A0 The two sets share a base and differ only in the regis=
ter offsets
>>> + * behind it, but are kept separate so each stays tied to the platfor=
m it was
>>> + * documented for.
>>> + */
>>> +#define SMN_HSMP_BASE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x03B=
00000
>>> +#define SMN_HSMP_MSG_ID=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x0=
0010534
>>> +#define SMN_HSMP_MSG_ID_F1A_M0H=C2=A0=C2=A0=C2=A0 0x00010934
>>> +#define SMN_HSMP_MSG_RESP=C2=A0=C2=A0=C2=A0 0x00010980
>>> +#define SMN_HSMP_MSG_DATA=C2=A0=C2=A0=C2=A0 0x000109E0
>>> +
>>> +/* _RM: Ryzen Master SMC, the client mailbox */
>>> +#define SMN_HSMP_BASE_RM=C2=A0=C2=A0=C2=A0 0x03B00000
>>> +#define SMN_HSMP_MSG_ID_RM=C2=A0=C2=A0=C2=A0 0x00010A8C
>>> +#define SMN_HSMP_MSG_RESP_RM=C2=A0=C2=A0=C2=A0 0x00010A90
>>> +#define SMN_HSMP_MSG_DATA_RM=C2=A0=C2=A0=C2=A0 0x00010A94
>>> +
>>> +/*
>>> + * Family 1Ah client platforms use the Ryzen Master SMC (client) mail=
box and
>>> + * message set instead of the server HSMP interface:
>>> + *
>>> + *=C2=A0=C2=A0=C2=A0 Models 80h-87h=C2=A0=C2=A0=C2=A0 Medusa1
>>> + *=C2=A0=C2=A0=C2=A0 Models 88h-8Fh=C2=A0=C2=A0=C2=A0 Olympic Ridge
>>> + *=C2=A0=C2=A0=C2=A0 Models E0h-E3h=C2=A0=C2=A0=C2=A0 Medusa2
>>> + *
>>> + * They all share the SMN_HSMP_*_RM mailbox addresses above and the s=
ame
>>> + * message set, so one predicate covers them and the two adjacent Mod=
el 8xh
>>> + * ranges are tested as one.
>>> + */
>>> +static inline bool is_client_platform(void)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 return boot_cpu_data.x86 =3D=3D 0x1A &&
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ((boot_c=
pu_data.x86_model >=3D 0x80 && boot_cpu_data.x86_model <=3D 0x8F) ||
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (boot_cpu_data.x86_model >=
=3D 0xE0 && boot_cpu_data.x86_model <=3D 0xE3));
>>> +}
>>> +
>>>  =C2=A0 struct hsmp_mbaddr_info {
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u32 base_addr;
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u32 msg_id_off;
>>> @@ -40,6 +88,30 @@ struct hsmp_mbaddr_info {
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u32 size;
>>>  =C2=A0 };
>>>  =C2=A0 +/*
>>> + * Per-platform description of the mailbox and the message set behind=
 it.
>>> + * Resolved once from the running CPU and reached through hsmp_pdev->=
desc, so
>>> + * neither the message plumbing nor the probe paths have to re-derive=
 which
>>> + * platform they are on.
>>> + *
>>> + * @mbinfo:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fixed SMN mailb=
ox addresses.=C2=A0 The ACPI path uses these
>>> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
only where firmware exposes no _CRS/_DSD to read them
>>> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
from, i.e. on the client.
>>> + * @msg_desc:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 message descr=
iptor table, indexed by message ID.
>>> + * @num_msgs:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 number of ent=
ries in @msg_desc, and so the exclusive
>>> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
upper bound on a valid message ID.
>>> + * @test_msg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 no-op message=
 used to probe the mailbox.=C2=A0 Also the
>>> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
lowest valid message ID, as ID 0 is reserved.
>>> + * @proto_ver_msg:=C2=A0=C2=A0=C2=A0 returns the interface version.
>>> + */
>>> +struct hsmp_plat_desc {
>>> +=C2=A0=C2=A0=C2=A0 const struct hsmp_mbaddr_info=C2=A0=C2=A0=C2=A0 *m=
binfo;
>>> +=C2=A0=C2=A0=C2=A0 const struct hsmp_msg_desc=C2=A0=C2=A0=C2=A0 *msg_=
desc;
>>> +=C2=A0=C2=A0=C2=A0 u32=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 num_msgs;
>>> +=C2=A0=C2=A0=C2=A0 u32=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 test_msg;
>>> +=C2=A0=C2=A0=C2=A0 u32=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 proto_ver_msg;
>>> +};
>>> +
>>>  =C2=A0 struct hsmp_socket {
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct bin_attribute hsmp_attr;
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct hsmp_mbaddr_info mbinfo;
>>> @@ -59,6 +131,7 @@ struct hsmp_socket {
>>>  =C2=A0 struct hsmp_plat_device {
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct miscdevice mdev;
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct hsmp_socket *sock;
>>> +=C2=A0=C2=A0=C2=A0 const struct hsmp_plat_desc *desc;
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u32 proto_ver;
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u16 num_sockets;
>>>  =C2=A0 };
>>> diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x=
86/amd/hsmp/plat.c
>>> index e9b2b809c0f5..7423c98a7b3e 100644
>>> --- a/drivers/platform/x86/amd/hsmp/plat.c
>>> +++ b/drivers/platform/x86/amd/hsmp/plat.c
>>> @@ -29,17 +29,6 @@
>>>  =C2=A0 =C2=A0 #define DRIVER_NAME=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 "amd_hsmp"
>>>  =C2=A0 -/*
>>> - * To access specific HSMP mailbox register, s/w writes the SMN addre=
ss of HSMP mailbox
>>> - * register into the SMN_INDEX register, and reads/writes the SMN_DAT=
A reg.
>>> - * Below are required SMN address for HSMP Mailbox register offsets i=
n SMU address space
>>> - */
>>> -#define SMN_HSMP_BASE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x3B0=
0000
>>> -#define SMN_HSMP_MSG_ID=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x0=
010534
>>> -#define SMN_HSMP_MSG_ID_F1A_M0H=C2=A0=C2=A0=C2=A0 0x0010934
>>> -#define SMN_HSMP_MSG_RESP=C2=A0=C2=A0=C2=A0 0x0010980
>>> -#define SMN_HSMP_MSG_DATA=C2=A0=C2=A0=C2=A0 0x00109E0
>>> -
>>>  =C2=A0 static struct hsmp_plat_device *hsmp_pdev;
>>>  =C2=A0 =C2=A0 static int amd_hsmp_pci_rdwr(struct hsmp_socket *sock, =
u32 offset,
>>> @@ -157,20 +146,18 @@ static int init_platform_device(struct device *d=
ev)
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sock =3D &hsmp=
_pdev->sock[i];
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sock->sock_ind=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D i;
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sock->dev=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D dev;
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sock->mbinfo.base_addr=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D SMN_HSMP_BASE;
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sock->amd_hsmp=
_rdwr=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D amd_hsmp_pci_rdwr;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sock->mbinfo=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D *hsmp_pdev->des=
c->mbinfo;
>>>  =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * This i=
s a transitional change from non-ACPI to ACPI, only
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * family=
 0x1A, model 0x00 platform is supported for both ACPI and non-ACPI.
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * It is the one part=
 whose message-id register sits at a
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * different offset o=
n this path than the descriptor gives.
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (is_f1a_m0h=
())
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 sock->mbinfo.msg_id_off=C2=A0=C2=A0=C2=A0 =3D SMN_HSMP_MSG_ID_F1=
A_M0H;
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 so=
ck->mbinfo.msg_id_off=C2=A0=C2=A0=C2=A0 =3D SMN_HSMP_MSG_ID;
>>>  =C2=A0 -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sock->mbinfo.msg_r=
esp_off=C2=A0=C2=A0=C2=A0 =3D SMN_HSMP_MSG_RESP;
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sock->mbinfo.msg_arg_off=
=C2=A0=C2=A0=C2=A0 =3D SMN_HSMP_MSG_DATA;
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sema_init(&soc=
k->hsmp_sem, 1);
>>>  =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Test=
 the hsmp interface on each socket */
>>> @@ -184,8 +171,18 @@ static int init_platform_device(struct device *de=
v)
>>>  =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D=
 hsmp_cache_proto_ver(i);
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret) {
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 de=
v_err(dev, "Failed to read HSMP protocol version\n");
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 re=
turn ret;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 * Some client SMU builds reject the interface-version
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 * query with "invalid message" even though the mailbox
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 * is functional, as the test message above just
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 * showed.=C2=A0 Keep going there instead of failing the
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 * probe: proto_ver only gates server-side features.
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 */
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if=
 (!is_client_platform()) {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 dev_err(dev, "Failed to read HSMP protocol version\n=
");
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 return ret;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 de=
v_warn(dev, "Interface version query unsupported on client SMU; continuing=
\n");
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>  =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (hsm=
p_pdev->proto_ver =3D=3D HSMP_PROTO_VER6) {
>>> @@ -317,6 +314,12 @@ static bool legacy_hsmp_support(void)
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case 0x1A:
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 switch (boot_c=
pu_data.x86_model) {
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case 0x00 ... =
0x0F:
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Client platforms: =
80h-87h (Medusa1), 88h-8Fh (Olympic
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Ridge), E0h-E3h (M=
edusa2)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case 0x80 ... 0x8F:
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case 0xE0 ... 0xE3:
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 return true;
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 default:
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 return false;
>
