Received: from outbound.ms.icloud.com (p-west3-cluster3-host4-snip4-4.eps.apple.com [57.103.72.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 985B53115B1
	for <platform-driver-x86@vger.kernel.org>; Mon, 17 Nov 2025 04:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.72.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763353686; cv=none; b=coVfWJyQHzb00dh29F6AA0/GEDKJad6DH3gjTiptti3DPGFjlP8GxTZcDEcI68HwzEIOFnC3ZYcbtQ85zNpZ1jFTGmeFSQd9k/3k9UDZsyLGqi4606oHyYw66qMcDKyKbsESc4hzepZv4Fd/9C9kjbunkO9RdDip0qbnQLEvpGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763353686; c=relaxed/simple;
	bh=vj2s7sZB3A5F447SuX+OYhClcuf6cVIx638oxnsK8zQ=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=ivyS1oalaJN3bB3PuQGSNIA7ydoexS77N0twoa1EPsnIR5IuJtGOI804W2KktnL26D5o6sPUf4Xg+nwJ4mGKogpilOWqKmMYZbdHKTB886TbKUzlmacPA26XNxW/Ro5+pOuLaeYjXURmTHbBBEeV8//IVZyE2XXszztMsZfsSHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=pass smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=Sl0AfW7u; arc=none smtp.client-ip=57.103.72.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ljones.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="Sl0AfW7u"
Received: from outbound.ms.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-3a-10-percent-0 (Postfix) with ESMTPS id B44EA1800115;
	Mon, 17 Nov 2025 04:28:02 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; s=sig1; bh=ySS9nLAWxEgBvlsIUAD6dIYgFRmLcenHESdLSJACwxA=; h=Content-Type:Mime-Version:Subject:From:Date:Message-Id:To:x-icloud-hme; b=Sl0AfW7uQkhQ+otOLDSDIuoefGqj1SfKQOS55adVNTMRPmum0gpSFO+TzPLjQ4cCSfbVeKA6NgRx/BtmJk8H9ITYuDYsgVL0FOTMHFFfalTN/wCy/KtoooZq0SVZG/pMy9LWeNzMRveq4EUDChBhKRPfvpANxKj4R4DreJ6VC+WsFpj5Oe5/z00VkT6nY1MuCtw+ZWY//RbqGGIHNeTMsOAqxyV6M6mdV2hVU4G9nWE2RLQXii3lRgPlXm1oDBSupD1XiuRDZYQmnw1SkZW9oTe9XjFkwbXJ1A8tyNd0oo2zyws1boJqcSabJz9SmBGdsTHLGD0i+LSYsoVtGBNShA==
mail-alias-created-date: 1566896761000
Received: from smtpclient.apple (unknown [17.57.154.37])
	by p00-icloudmta-asmtp-us-west-3a-10-percent-0 (Postfix) with ESMTPSA id 075991800544;
	Mon, 17 Nov 2025 04:27:59 +0000 (UTC)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.300.22\))
Subject: Re: [PATCH] platform/x86: asus-armoury: remove unsafe CPU cores
 unsafe interface
From: luke@ljones.dev
In-Reply-To: <20251115145158.1172210-1-denis.benato@linux.dev>
Date: Mon, 17 Nov 2025 17:27:47 +1300
Cc: linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org,
 Hans de Goede <hansg@kernel.org>,
 =?utf-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Limonciello, Mario" <mario.limonciello@amd.com>,
 Alok Tiwari <alok.a.tiwari@oracle.com>,
 Derek John Clark <derekjohn.clark@gmail.com>,
 Mateusz Schyboll <dragonn@op.pl>,
 porfet828@gmail.com,
 Denis Benato <benato.denis96@gmail.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <A7906040-D491-4D34-969E-64E172FA9126@ljones.dev>
References: <20251115145158.1172210-1-denis.benato@linux.dev>
To: Denis Benato <denis.benato@linux.dev>
X-Mailer: Apple Mail (2.3864.300.22)
X-Proofpoint-ORIG-GUID: -luQAAyLI8ZJHXDi9fUSLkNOAkDDyAhj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDAzNSBTYWx0ZWRfX0s6hzWUMJNj7
 CVDfq6YqtLUz6Ock+XXeYkV8UL7Ajj713NW9JGg++ZTy8ypqj6V2IHyQpoJWAkL2uFMX+DWCa1t
 dnLdWsGmGkJJsdwSgPPYA7LKI3aJJeXQ/MtSzqDLuF5kOfrXzlglmBskI0pJAt2MaeksUYB0W8O
 nJwITVhlsKgbMVMRGQSQSH+Xz7ZjitM+h5mwD8TTee5XHFKMPYrUhTL852EtamE0KDWbT2miDWJ
 xHr4nez+0Fyf7zjXJUa5AqS4daaPjMa1BRTasST5ig773amXWytiFl0vBZ074k24DbzTkg+IMLb
 qaWT5x3kp0qddwqZq4A
X-Proofpoint-GUID: -luQAAyLI8ZJHXDi9fUSLkNOAkDDyAhj
X-Authority-Info: v=2.4 cv=WJZyn3sR c=1 sm=1 tr=0 ts=691aa453 cx=c_apl:c_pps
 a=qkKslKyYc0ctBTeLUVfTFg==:117 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=zd2uoN0lAAAA:8
 a=8LoWFNH8OOw4e1sx6Q0A:9 a=QEXdDO2ut3YA:10 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_02,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 adultscore=0 suspectscore=0 mlxlogscore=999 malwarescore=0 mlxscore=0
 spamscore=0 phishscore=0 clxscore=1030 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170035
X-JNJ: AAAAAAABPFnV8hyI7n/r0PNMVa+xzS2bqbJzQScTyaMEs7AD4VNSoYod9mqnMQEgF/2VILOmRY7jQRL2wljgd4W8vglXtPxeWyRgHpOaNDEcw0U5P79Ch9AuEtEeXqAPT89pDecb8nKNt7xlHLZMNfYr5Ah1H2AycyOD1dAEvxqmKMipjA9++JqDHxRoRhIneoDZ4oKSIV+9vC8DsF8SJHX0V1aQOvMOc2TP9hzpOC2SyNCM3g6NwhSzhP4nSd3HyboH/FqJEUCMSF9iUe6BcBmlOqXlZ5z9vhQPIbQADi94GR0tNZLonP53wBI+g/M5A2FquqRzo2swK0ftRDy3A/xX9Rgm+3BK4FmxaY6ayf/f8qvphB7OBDPZTHd2FfxxoraGfVk839Fbtx+24lx3WQJE4xcGUXWp+4sxxWbEgf1vOlbAMI684h4bctGRmSlgzm1k0W0iJZwVh8Z6Z+aNRIukbRiWCqZllRUjNAotfhwnC5b5RUo50yt1FChUSK58PC58laZH5yrMPd2g5c50omNEz5Z9FX9YQmV/TZKIXpl5xFcIa4wtSabgutKIJEDD2w1WgWlexjRZviHPosEzZCgTH6IH1B6+Wmb96LuySSXPJVPffNG6oeMoHvsHZB0b3jHMKhTrp5Fy0wfR5dj55237HvbOCZg1VoagvrU4XI0D+36f10koCFPWHrHQLjVZ0iYgmS5efSDVk8KnGa6HFeIfjBgLCiA6T+/aGTsyGWfTfgePxP/KYIrcOCsmn4omnAzkxB5XiDnUe92JQVS70OFwRI19


> On 16 Nov 2025, at 03:51, Denis Benato <denis.benato@linux.dev> wrote:
>=20
> CPU cores unsafe interface is known to be problematic and recently new
> hardware that is using it in an incompatible way was released, =
therefore
> remove this interface to avoid any present and future risks.
>=20
> Link: =
https://lore.kernel.org/all/018ce202-420c-40c9-a089-b3509c7ee4bd@gmail.com=


I=E2=80=99ll copy/paste my response to other thread here:

I spent a long time debating this myself. Never liked it tbh (the =
implementation or the actual setting).
It seems that at least making it RO so that if a user changes the =
settings using the BIOS controls for it, it can at least be tracked in =
userspace and not lead to confusion might be the best option. It only =
needs to show the values then - no min/max or other parts required.

This setting is independent to the AMD version and if BIOS changes it, =
it may lead to a lot of confusion between this plus the official AMD =
setting.
If users dual boot at all and use the armoury crate to control this, =
then that app will use the WMI methods. Again leading to confusion in =
Linux environment. This is actually the main reason I implemented it =
first time around and it was initially a read-only attribute.

Do what is best for users and maintenance and safety. At least make it =
RO at a minimum.

Cheers,
Luke.

>=20
> Suggested-by: Mario Limonciello <mario.limonciello@amd.com>
> Suggested-by: Derek John Clark <derekjohn.clark@gmail.com>
> Signed-off-by: Denis Benato <denis.benato@linux.dev>
> ---
> drivers/platform/x86/asus-armoury.c        | 286 +--------------------
> drivers/platform/x86/asus-armoury.h        |  28 --
> include/linux/platform_data/x86/asus-wmi.h |   2 +-
> 3 files changed, 8 insertions(+), 308 deletions(-)
>=20
> diff --git a/drivers/platform/x86/asus-armoury.c =
b/drivers/platform/x86/asus-armoury.c
> index 9f67218ecd14..31a3046b7d63 100644
> --- a/drivers/platform/x86/asus-armoury.c
> +++ b/drivers/platform/x86/asus-armoury.c
> @@ -60,39 +60,9 @@
> #define ATTR_NV_BASE_TGP        "nv_base_tgp"
> #define ATTR_NV_TGP             "nv_tgp"
>=20
> -#define ASUS_POWER_CORE_MASK	GENMASK(15, 8)
> -#define ASUS_PERF_CORE_MASK	GENMASK(7, 0)
> -
> #define ASUS_ROG_TUNABLE_DC 0
> #define ASUS_ROG_TUNABLE_AC 1
>=20
> -enum cpu_core_type {
> -	CPU_CORE_PERF =3D 0,
> -	CPU_CORE_POWER,
> -};
> -
> -enum cpu_core_value {
> -	CPU_CORE_DEFAULT =3D 0,
> -	CPU_CORE_MIN,
> -	CPU_CORE_MAX,
> -	CPU_CORE_CURRENT,
> -};
> -
> -/* Minimum number of performance cores (P-cores) */
> -#define CPU_PERF_CORE_COUNT_MIN 4
> -/* Minimum number of efficiency cores (E-cores) */
> -#define CPU_POWR_CORE_COUNT_MIN 0
> -
> -/* Tunables provided by ASUS for gaming laptops */
> -struct cpu_cores {
> -	u32 cur_perf_cores;
> -	u32 min_perf_cores;
> -	u32 max_perf_cores;
> -	u32 cur_power_cores;
> -	u32 min_power_cores;
> -	u32 max_power_cores;
> -};
> -
> struct rog_tunables {
> 	const struct power_limits *power_limits;
> 	u32 ppt_pl1_spl;			// cpu
> @@ -118,14 +88,6 @@ struct asus_armoury_priv {
> 	 */
> 	struct mutex egpu_mutex;
>=20
> -	/*
> -	 * Mutex to prevent big/little core count changes writing to =
same
> -	 * endpoint at the same time. Must lock during attr store.
> -	 */
> -	struct mutex cpu_core_mutex;
> -	struct cpu_cores *cpu_cores;
> -	bool cpu_cores_changeable;
> -
> 	/* Index 0 for DC, 1 for AC */
> 	struct rog_tunables *rog_tunables[2];
>=20
> @@ -135,8 +97,6 @@ struct asus_armoury_priv {
>=20
> static struct asus_armoury_priv asus_armoury =3D {
> 	.egpu_mutex =3D __MUTEX_INITIALIZER(asus_armoury.egpu_mutex),
> -
> -	.cpu_core_mutex =3D =
__MUTEX_INITIALIZER(asus_armoury.cpu_core_mutex),
> };
>=20
> struct fw_attrs_group {
> @@ -168,8 +128,6 @@ static struct kobj_attribute pending_reboot =3D =
__ATTR_RO(pending_reboot);
> static bool asus_bios_requires_reboot(struct kobj_attribute *attr)
> {
> 	return !strcmp(attr->attr.name, "gpu_mux_mode") ||
> -	       !strcmp(attr->attr.name, "cores_performance") ||
> -	       !strcmp(attr->attr.name, "cores_efficiency") ||
> 	       !strcmp(attr->attr.name, "panel_hd_mode");
> }
>=20
> @@ -275,16 +233,14 @@ static int armoury_set_devstate(struct =
kobj_attribute *attr,
> 		break;
> 	case ASUS_WMI_DEVID_CORES:
> 		/*
> -		 * Prevent risk disabling cores essential for booting =
the system
> -		 * up to a point where system settings can be reset:
> -		 * this has already caused unrecoverable bricks in the =
past.
> +		 * Due to out-of-specification usage, this WMI interface
> +		 * has already caused unrecoverable bricks in the past.
> 		 */
> -		if ((FIELD_GET(ASUS_POWER_CORE_MASK, value) < =
CPU_POWR_CORE_COUNT_MIN) ||
> -		    (FIELD_GET(ASUS_PERF_CORE_MASK, value) < =
CPU_PERF_CORE_COUNT_MIN)) {
> -			pr_err("Refusing to set CPU cores to unsafe =
value: 0x%x\n", value);
> -			return -EINVAL;
> -		}
> -		break;
> +		pr_err("Refusing to use CPU cores count unsafe =
interface\n");
> +		return -EINVAL;
> +	case ASUS_WMI_DEVID_CORES_MAX:
> +		pr_err("Refusing to write to readonly devstate part of =
unsafe interface\n");
> +		return -EINVAL;
> 	default:
> 		/* No known problems are known for this dev_id */
> 		break;
> @@ -787,178 +743,6 @@ static ssize_t =
apu_mem_possible_values_show(struct kobject *kobj, struct kobj_at
> }
> ASUS_ATTR_GROUP_ENUM(apu_mem, "apu_mem", "Set available system RAM (in =
GB) for the APU to use");
>=20
> -static struct cpu_cores *init_cpu_cores_ctrl(void)
> -{
> -	u32 cores;
> -	int err;
> -	struct cpu_cores *cores_p __free(kfree) =3D NULL;
> -
> -	cores_p =3D kzalloc(sizeof(struct cpu_cores), GFP_KERNEL);
> -	if (!cores_p)
> -		return ERR_PTR(-ENOMEM);
> -
> -	err =3D armoury_get_devstate(NULL, &cores, =
ASUS_WMI_DEVID_CORES_MAX);
> -	if (err) {
> -		pr_err("ACPI does not support CPU core count =
control\n");
> -		return ERR_PTR(-ENODEV);
> -	}
> -
> -	cores_p->max_power_cores =3D FIELD_GET(ASUS_POWER_CORE_MASK, =
cores);
> -	cores_p->max_perf_cores =3D FIELD_GET(ASUS_PERF_CORE_MASK, =
cores);
> -
> -	err =3D armoury_get_devstate(NULL, &cores, =
ASUS_WMI_DEVID_CORES);
> -	if (err) {
> -		pr_err("Could not get CPU core count: error %d\n", err);
> -		return ERR_PTR(-EIO);
> -	}
> -
> -	cores_p->cur_power_cores =3D FIELD_GET(ASUS_POWER_CORE_MASK, =
cores);
> -	cores_p->cur_perf_cores =3D FIELD_GET(ASUS_PERF_CORE_MASK, =
cores);
> -
> -	cores_p->min_power_cores =3D CPU_POWR_CORE_COUNT_MIN;
> -	cores_p->min_perf_cores =3D CPU_PERF_CORE_COUNT_MIN;
> -
> -	if ((cores_p->min_perf_cores > cores_p->max_perf_cores) ||
> -	    (cores_p->min_power_cores > cores_p->max_power_cores)
> -	) {
> -		pr_err("Invalid CPU cores count detected: interface is =
not safe to be used.\n");
> -		return ERR_PTR(-EINVAL);
> -	}
> -
> -	if ((cores_p->cur_perf_cores > cores_p->max_perf_cores) ||
> -		(cores_p->cur_power_cores > cores_p->max_power_cores) ||
> -		(cores_p->cur_perf_cores < cores_p->min_perf_cores) ||
> -		(cores_p->cur_power_cores < cores_p->min_power_cores)
> -	) {
> -		pr_warn("Current CPU cores count are outside safe =
limits.\n");
> -	}
> -
> -	return no_free_ptr(cores_p);
> -}
> -
> -static ssize_t cores_value_show(struct kobject *kobj, struct =
kobj_attribute *attr, char *buf,
> -				enum cpu_core_type core_type, enum =
cpu_core_value core_value)
> -{
> -	u32 cpu_core_value;
> -
> -	switch (core_value) {
> -	case CPU_CORE_DEFAULT:
> -	case CPU_CORE_MAX:
> -		cpu_core_value =3D (core_type =3D=3D CPU_CORE_PERF) ?
> -			asus_armoury.cpu_cores->max_perf_cores :
> -			asus_armoury.cpu_cores->max_power_cores;
> -		break;
> -	case CPU_CORE_MIN:
> -		cpu_core_value =3D (core_type =3D=3D CPU_CORE_PERF) ?
> -			asus_armoury.cpu_cores->min_perf_cores :
> -			asus_armoury.cpu_cores->min_power_cores;
> -		break;
> -	case CPU_CORE_CURRENT:
> -		cpu_core_value =3D (core_type =3D=3D CPU_CORE_PERF) ?
> -			asus_armoury.cpu_cores->cur_perf_cores :
> -			asus_armoury.cpu_cores->cur_power_cores;
> -		break;
> -	default:
> -		return -EINVAL;
> -	}
> -
> -	return sysfs_emit(buf, "%u\n", cpu_core_value);
> -}
> -
> -static ssize_t cores_current_value_store(struct kobject *kobj, struct =
kobj_attribute *attr,
> -					 const char *buf, enum =
cpu_core_type core_type)
> -{
> -	u32 new_cores, perf_cores, power_cores, out_val, min, max, =
result;
> -	int err;
> -
> -	result =3D kstrtou32(buf, 10, &new_cores);
> -	if (result)
> -		return result;
> -
> -	scoped_guard(mutex, &asus_armoury.cpu_core_mutex) {
> -		if (!asus_armoury.cpu_cores_changeable) {
> -			pr_warn("CPU core count change not allowed until =
reboot\n");
> -			return -EBUSY;
> -		}
> -
> -		if (core_type =3D=3D CPU_CORE_PERF) {
> -			perf_cores =3D new_cores;
> -			power_cores =3D =
asus_armoury.cpu_cores->cur_power_cores;
> -			min =3D asus_armoury.cpu_cores->min_perf_cores;
> -			max =3D asus_armoury.cpu_cores->max_perf_cores;
> -		} else {
> -			perf_cores =3D =
asus_armoury.cpu_cores->cur_perf_cores;
> -			power_cores =3D new_cores;
> -			min =3D asus_armoury.cpu_cores->min_power_cores;
> -			max =3D asus_armoury.cpu_cores->max_power_cores;
> -		}
> -
> -		if (new_cores < min || new_cores > max)
> -			return -EINVAL;
> -
> -		out_val =3D FIELD_PREP(ASUS_PERF_CORE_MASK, perf_cores) =
|
> -			FIELD_PREP(ASUS_POWER_CORE_MASK, power_cores);
> -
> -		asus_armoury.cpu_cores_changeable =3D false;
> -		err =3D armoury_set_devstate(attr, out_val, &result, =
ASUS_WMI_DEVID_CORES);
> -		if (err) {
> -			pr_warn("Failed to set CPU core count: %d\n", =
err);
> -			return err;
> -		}
> -
> -		if (result > 1) {
> -			pr_warn("Failed to set CPU core count (result): =
0x%x\n", result);
> -			return -EIO;
> -		}
> -	}
> -
> -	pr_info("CPU core count changed, reboot required\n");
> -
> -	sysfs_notify(kobj, NULL, attr->attr.name);
> -	asus_set_reboot_and_signal_event();
> -
> -	return 0;
> -}
> -
> -static ssize_t cores_performance_min_value_show(struct kobject *kobj,
> -						struct kobj_attribute =
*attr, char *buf)
> -{
> -	return cores_value_show(kobj, attr, buf, CPU_CORE_PERF, =
CPU_CORE_MIN);
> -}
> -
> -static ssize_t cores_performance_max_value_show(struct kobject *kobj,
> -						struct kobj_attribute =
*attr, char *buf)
> -{
> -	return cores_value_show(kobj, attr, buf, CPU_CORE_PERF, =
CPU_CORE_MAX);
> -}
> -
> -static ssize_t cores_performance_default_value_show(struct kobject =
*kobj,
> -						    struct =
kobj_attribute *attr, char *buf)
> -{
> -	return cores_value_show(kobj, attr, buf, CPU_CORE_PERF, =
CPU_CORE_DEFAULT);
> -}
> -
> -static ssize_t cores_performance_current_value_show(struct kobject =
*kobj,
> -						    struct =
kobj_attribute *attr, char *buf)
> -{
> -	return cores_value_show(kobj, attr, buf, CPU_CORE_PERF, =
CPU_CORE_CURRENT);
> -}
> -
> -static ssize_t cores_performance_current_value_store(struct kobject =
*kobj,
> -						     struct =
kobj_attribute *attr,
> -						     const char *buf, =
size_t count)
> -{
> -	int err;
> -
> -	err =3D cores_current_value_store(kobj, attr, buf, =
CPU_CORE_PERF);
> -	if (err)
> -		return err;
> -
> -	return count;
> -}
> -ASUS_ATTR_GROUP_CORES_RW(cores_performance, "cores_performance",
> -			 "Set the max available performance cores");
> -
> /* Define helper to access the current power mode tunable values */
> static inline struct rog_tunables *get_current_tunables(void)
> {
> @@ -968,45 +752,6 @@ static inline struct rog_tunables =
*get_current_tunables(void)
> 	return asus_armoury.rog_tunables[ASUS_ROG_TUNABLE_DC];
> }
>=20
> -static ssize_t cores_efficiency_min_value_show(struct kobject *kobj, =
struct kobj_attribute *attr,
> -					       char *buf)
> -{
> -	return cores_value_show(kobj, attr, buf, CPU_CORE_POWER, =
CPU_CORE_MIN);
> -}
> -
> -static ssize_t cores_efficiency_max_value_show(struct kobject *kobj, =
struct kobj_attribute *attr,
> -					       char *buf)
> -{
> -	return cores_value_show(kobj, attr, buf, CPU_CORE_POWER, =
CPU_CORE_MAX);
> -}
> -
> -static ssize_t cores_efficiency_default_value_show(struct kobject =
*kobj,
> -						   struct kobj_attribute =
*attr, char *buf)
> -{
> -	return cores_value_show(kobj, attr, buf, CPU_CORE_POWER, =
CPU_CORE_DEFAULT);
> -}
> -
> -static ssize_t cores_efficiency_current_value_show(struct kobject =
*kobj,
> -						   struct kobj_attribute =
*attr, char *buf)
> -{
> -	return cores_value_show(kobj, attr, buf, CPU_CORE_POWER, =
CPU_CORE_CURRENT);
> -}
> -
> -static ssize_t cores_efficiency_current_value_store(struct kobject =
*kobj,
> -						    struct =
kobj_attribute *attr, const char *buf,
> -						    size_t count)
> -{
> -	int err;
> -
> -	err =3D cores_current_value_store(kobj, attr, buf, =
CPU_CORE_POWER);
> -	if (err)
> -		return err;
> -
> -	return count;
> -}
> -ASUS_ATTR_GROUP_CORES_RW(cores_efficiency, "cores_efficiency",
> -		    "Set the max available efficiency cores");
> -
> /* Simple attribute creation */
> ASUS_ATTR_GROUP_ENUM_INT_RO(charge_mode, "charge_mode", =
ASUS_WMI_DEVID_CHARGE_MODE, "0;1;2\n",
> 			    "Show the current mode of charging");
> @@ -1048,8 +793,6 @@ static const struct asus_attr_group =
armoury_attr_groups[] =3D {
> 	{ &egpu_enable_attr_group, ASUS_WMI_DEVID_EGPU },
> 	{ &dgpu_disable_attr_group, ASUS_WMI_DEVID_DGPU },
> 	{ &apu_mem_attr_group, ASUS_WMI_DEVID_APU_MEM },
> -	{ &cores_efficiency_attr_group, ASUS_WMI_DEVID_CORES_MAX },
> -	{ &cores_performance_attr_group, ASUS_WMI_DEVID_CORES_MAX },
>=20
> 	{ &ppt_pl1_spl_attr_group, ASUS_WMI_DEVID_PPT_PL1_SPL },
> 	{ &ppt_pl2_sppt_attr_group, ASUS_WMI_DEVID_PPT_PL2_SPPT },
> @@ -1374,8 +1117,6 @@ static void init_rog_tunables(void)
> static int __init asus_fw_init(void)
> {
> 	char *wmi_uid;
> -	struct cpu_cores *cpu_cores_ctrl;
> -	int err;
>=20
> 	wmi_uid =3D wmi_get_acpi_device_uid(ASUS_WMI_MGMT_GUID);
> 	if (!wmi_uid)
> @@ -1388,19 +1129,6 @@ static int __init asus_fw_init(void)
> 	if (!strcmp(wmi_uid, ASUS_ACPI_UID_ASUSWMI))
> 		return -ENODEV;
>=20
> -	asus_armoury.cpu_cores_changeable =3D false;
> -	if (armoury_has_devstate(ASUS_WMI_DEVID_CORES_MAX)) {
> -		cpu_cores_ctrl =3D init_cpu_cores_ctrl();
> -		if (IS_ERR(cpu_cores_ctrl)) {
> -			err =3D PTR_ERR(cpu_cores_ctrl);
> -			pr_err("Could not initialise CPU core control: =
%d\n", err);
> -			return err;
> -		}
> -
> -		asus_armoury.cpu_cores =3D cpu_cores_ctrl;
> -		asus_armoury.cpu_cores_changeable =3D true;
> -	}
> -
> 	init_rog_tunables();
>=20
> 	/* Must always be last step to ensure data is available */
> diff --git a/drivers/platform/x86/asus-armoury.h =
b/drivers/platform/x86/asus-armoury.h
> index 2f05a2e0cab3..548c66c590a6 100644
> --- a/drivers/platform/x86/asus-armoury.h
> +++ b/drivers/platform/x86/asus-armoury.h
> @@ -198,34 +198,6 @@ ssize_t armoury_attr_uint_show(struct kobject =
*kobj, struct kobj_attribute *attr
> 		.name =3D _fsname, .attrs =3D _attrname##_attrs			=
\
> 	}
>=20
> -/* CPU core attributes need a little different in setup */
> -#define ASUS_ATTR_GROUP_CORES_RW(_attrname, _fsname, _dispname)		=
\
> -	__ATTR_SHOW_FMT(scalar_increment, _attrname, "%d\n", 1);	=
\
> -	__ATTR_SHOW_FMT(display_name, _attrname, "%s\n", _dispname);	=
\
> -	static struct kobj_attribute attr_##_attrname##_current_value =3D	=
\
> -		__ASUS_ATTR_RW(_attrname, current_value);		=
\
> -	static struct kobj_attribute attr_##_attrname##_default_value =3D =
\
> -		__ASUS_ATTR_RO(_attrname, default_value);		=
\
> -	static struct kobj_attribute attr_##_attrname##_min_value =3D	=
\
> -		__ASUS_ATTR_RO(_attrname, min_value);			=
\
> -	static struct kobj_attribute attr_##_attrname##_max_value =3D	=
\
> -		__ASUS_ATTR_RO(_attrname, max_value);			=
\
> -	static struct kobj_attribute attr_##_attrname##_type =3D		=
\
> -		__ASUS_ATTR_RO_AS(type, int_type_show);			=
\
> -	static struct attribute *_attrname##_attrs[] =3D {		=
\
> -		&attr_##_attrname##_current_value.attr,			=
\
> -		&attr_##_attrname##_default_value.attr,			=
\
> -		&attr_##_attrname##_min_value.attr,			=
\
> -		&attr_##_attrname##_max_value.attr,			=
\
> -		&attr_##_attrname##_scalar_increment.attr,		=
\
> -		&attr_##_attrname##_display_name.attr,			=
\
> -		&attr_##_attrname##_type.attr,				=
\
> -		NULL							=
\
> -	};								=
\
> -	static const struct attribute_group _attrname##_attr_group =3D {	=
\
> -		.name =3D _fsname, .attrs =3D _attrname##_attrs		=
\
> -	}
> -
> #define ASUS_ATTR_GROUP_INT_VALUE_ONLY_RO(_attrname, _fsname, _wmi, =
_dispname)	\
> 	ASUS_WMI_SHOW_INT(_attrname##_current_value, _wmi);		=
\
> 	static struct kobj_attribute attr_##_attrname##_current_value =3D	=
	\
> diff --git a/include/linux/platform_data/x86/asus-wmi.h =
b/include/linux/platform_data/x86/asus-wmi.h
> index 51b7ccddbdaf..076b709f980e 100644
> --- a/include/linux/platform_data/x86/asus-wmi.h
> +++ b/include/linux/platform_data/x86/asus-wmi.h
> @@ -139,7 +139,7 @@
>=20
> /* Intel E-core and P-core configuration in a format 0x0[E]0[P] */
> #define ASUS_WMI_DEVID_CORES		0x001200D2
> - /* Maximum Intel E-core and P-core availability */
> +/* Maximum Intel E-core and P-core availability */
> #define ASUS_WMI_DEVID_CORES_MAX	0x001200D3
>=20
> #define ASUS_WMI_DEVID_APU_MEM		0x000600C1
> --=20
> 2.51.2
>=20

