Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B8F845A2AB
	for <platform-driver-x86@vger.kernel.org>; Fri,  9 Oct 2026 23:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791586866; cv=none; b=DrgMLaSkKuHEPEDkEEgVN+m9JERE/Rt5rZeyHF0YZee8sXHMiLHfE0nN4id/YW8tB4i06q+5Eim6CchcHBWCA+Au5r37Z4Vek7LEnV7dX/Ru2SP2sD7SzM8oSkYnndBKsc91sOjcnYEzXquFGny0xuvbEum7sEY3qw0r5sQ3+Uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791586866; c=relaxed/simple;
	bh=YVehI8L9SJ/A2wQFyYiJGvjdJACXkIjxc5WMgO8QJ/A=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=K5XJ5wRacyc7p4c8sS9yO4uedWywh61Xuq6sXKT1pys38OxfVgj719uvMqCcFMApsmHI5+W1CAEfoY92ZpuU+fnvVD0Lh0bEof8kEnHlwgBhrupnl/VPmgPtLy34Mj4uBZqSOF+HyAVW+1T+d5Pi8AX7g55BSBySndatMa4UQmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hUyUrG6G; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hUyUrG6G"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-3282db206d3so549694eec.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 09 Oct 2026 16:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791586864; x=1792191664; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=LUMRwMi42ONolR4FJ6zVYn5shjf3e1soCnTUAifdauM=;
        b=hUyUrG6Gl44lqhkykP0p9NT2TAQe0zeQiifnOL5bcgYV2igs/HofHnbKT1NDCmSaYj
         wP8frLLgnSVbQn5ILIt4o2lQ30d6BCaQh/S54Gdjt7KZhmcDOWzA1FylcVeLO3HJVPJU
         1ElJwffJDgMyJWlO54wbPd3T5ebu5YYHXpkZOPx3fkXSDM+1dQ24dUFM3j8V6mkXoK0g
         0aDjzAlLJ9jC/yRhdu3LTz2PrgGjkA/Ol4zp8kWE9IhtF+kOr5z79oE3va964kXS2/qE
         kEJOaE56bIIgjMo5kOyFeJ9w+ZOojcKnqQUItA5hJ3nma7+GZWFP06K30bPqEdwtJauC
         GKSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791586864; x=1792191664;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LUMRwMi42ONolR4FJ6zVYn5shjf3e1soCnTUAifdauM=;
        b=YKTYEm0QqLFxdWF/L26EoD8/tHNJInfgtdfhen3RTXdnyiGxBV97cMJB6h6d9MIuS5
         YWNwCPUPlKWdpHMXX2+44SsWbYgWg8mFeSnR14sTpDS8kn+znIW/selCwKzPk8uwfjV2
         ixNbcWF3uMuViT76tZSjGqa/1DIZav+vhvFfCsqRaAuGpAbvcHr7UboFDLbR+sBqfr9n
         50vGOf4dQO1Rv4gcXIzN++3WE4jx7MNs6sHQySBpvAu4rnJMgRfzGGVFjyy/bvY8iEOc
         3zAcdMWB8qOUYUsmOJFgiI1Uex/1iLs/nAXe6pBDZaPhdIsOpNU34i7SEa86CoHfbNsP
         JpNQ==
X-Forwarded-Encrypted: i=1; AKwUvBx5cpKL88dt1VBdNLgqippaESkYjVmhLjNZfB83PvVa7jS1+QWfNfWZg744+9DPj9/Ra5O5B61wxrCpupQ2achZMKCT@vger.kernel.org
X-Gm-Message-State: AFq9FYJjirJBV+WsOGNcBcqozmdLIHeAe/we6Pq9qSvm3EVj0EfLUn+Z
	JFycMNra/mF8VOY79A/FNte+l9QewpGIeu8e/wAo0f9H4jIJE8GwrDjq
X-Gm-Gg: AYBFou1lP04jrFGl614/MmOZShodRLauFTKmqTSWSpTieOf2OECoEPvO+YR3fKIuREo
	d9/MpgB/j/sFQm1CVjauOAMQWyGTQWCgE6/F9ES4B4dZBMDn6thcLxMAeW7p7FYbGwahVRnnYJU
	JGoIJC1l4zt8d7buBzFuaE3u29XJkfqV24hTpBGt3wXxgaxT0K1c7gRiXmnaifsUyuOAqRGuLMD
	o0dpfJ7UPTX4HZiGM303bjD/z8PodXiuqzaBfPrhamCY8w8TcoEpGfbw5Xxbcwd0yw0XFqiKl7W
	r5Xj6fCLVjjjmHrvY/Mf5guMgb5ZrqqQcdaapU7zBfWM/h1w07PU2NebK2pJhd1MuUHLoUU52pH
	tPnBeLHNg5n/bBiScO7NtmPIzh9Ix0+CLtJJNC5flxrfgRUy7ubHj0GK/lpBsp6xg13A94cAgNI
	zNCIaynU9VOhDt4j92cBSTl+7dCbt9LiG5BP7E5ScKMsEQb/ZP9G6am4PO/b+zYy1484O2eCcY5
	1cI65dQ5ff+o4t2QcHMPN5+g4XuQ/4FbwixxdyrksCgJoDw+9UETRzutFIqvoJ0HOHm
X-Received: by 2002:a05:7300:cf8f:b0:351:28eb:8cd8 with SMTP id 5a478bee46e88-3537dfd8b22mr4251148eec.18.1791586863163;
        Fri, 09 Oct 2026 16:01:03 -0700 (PDT)
Received: from ehlo.thunderbird.net (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca6d20dsm9521259eec.12.2026.10.09.16.01.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 16:01:02 -0700 (PDT)
Date: Fri, 09 Oct 2026 16:01:02 -0700
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Rong Zhang <i@rong.moe>, Mark Pearson <mpearson-lenovo@squebb.ca>,
 Hans de Goede <hansg@kernel.org>,
 =?ISO-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Armin Wolf <W_Armin@gmx.de>
CC: Charles <hanker007@gmail.com>, Navon John Lukose <navonjohnlukose@gmail.com>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2_00/12=5D_platfo?=
 =?US-ASCII?Q?rm/x86=3A_lenovo-wmi-=7Bother=2Cc?=
 =?US-ASCII?Q?apdata=2Chelpers=7D=3A_Improve_robustness_on_faulty_firmware?=
User-Agent: Thunderbird for Android
In-Reply-To: <20261009-lwmi-wmi-new-api-v2-0-402828382679@rong.moe>
References: <20261009-lwmi-wmi-new-api-v2-0-402828382679@rong.moe>
Message-ID: <AB350CB0-8739-4F10-8055-875FE31EF242@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On October 9, 2026 5:53:42 AM PDT, Rong Zhang <i@rong=2Emoe> wrote:
>Some devices do not support LENOVO_CAPABILITY_DATA_01 and define the
>query method as a stub that returns zero buffer=2E Unfortunately, some
>devices do not implement the stub properly, causing WMI errors
>(including ACPI errors)=2E This was reported by Charles=2E
>
>The current lenovo-wmi-* implementation enforces the binding between
>LENOVO_CAPABILITY_DATA_00+01 and LENOVO_OTHER_MODE because of a
>limitation of the device component framework=2E When the capdata device
>bailing out due to a WMI error, lenovo-wmi-other becomes unbound and
>unable to provide firmware-attributes or hwmon/power_supply_ext devices
>for the other functional capdata device=2E
>
>Therefore, errors must be non-fatal in order not to break the
>assumptions made by the device component framework=2E
>
>Poison the capdata device by releasing the capability data list in this
>case=2E After that, NULL list will be passed to lenovo-wmi-other on bind=
=2E
>The latter will provide whatever is available, or unbind the components
>if nothing is available=2E
>
>A poisoned capdata device releases or skips allocating most resources,
>e=2Eg=2E, the capability data list and the debugfs directory=2E The devic=
e
>itself is only used to satisfy the component dependency of lenovo-wmi-
>other and coordinate with the latter about the absence of the capability
>data=2E
>
>Meanwhile, for devices that properly stubs the WMI query method (but
>still declares >0 instances), keeping the capability data list with
>empty data is meaningless and causes lenovo-wmi-other to call
>lwmi_cd*_get_data() to retrieve nonexistent capdata in vain=2E These
>capdata devices are poisoned as well to save resources=2E
>
>In order to release or skip allocating most resources for poisoned
>devices, some preparatory work is done in prior=2E With the preparatory
>work, it also skips allocating most resources for the WMI devices that
>declare 0 instance=2E
>
>Also identify missing components using the new wmidev_exists() interface
>(introduced at the very beginning of the series), and skip adding them
>to the match list, so that all components in the list must present,
>fulfilling the binding requirement=2E Some devices need this because they
>either do not have the WMI GUID of LENOVO_CAPABILITY_DATA_01, or do not
>implement the query method, causing the WMI core not to create the
>corresponding WMI device=2E This was reported by Navon=2E
>
>The new WMI API is also adopted to conform to the behavior of the
>Windows WMI-ACPI driver and improve robustness on various WMI ACPI
>method implementation=2E
>
>Finally, add myself as a LENOVO drivers maintainer as previously
>suggested by Derek=2E

Hi Rong,

I'll try to fully test all my devices this weekend to add a T/b tag=2E In =
the mantime, everything looks good, save for that minor nit you already ack=
ed=2E=20

With that resolved, for the series:
Reviewed-by: Derek J=2E Clark <derekjohn=2Eclark@gmail=2Ecom>

Thanks,
- Derek

>Reported-by: Charles <hanker007@gmail=2Ecom>
>Closes: https://msgid=2Elink/CAKtz0s8UYRQYW_0bh=3D0TMx47Axm-W-muEay-r3rqU=
BS1NHMPVw@mail=2Egmail=2Ecom/
>Reported-by: Navon John Lukose <navonjohnlukose@gmail=2Ecom>
>Closes: https://msgid=2Elink/20260928190901=2E1369497-1-navonjohnlukose@g=
mail=2Ecom
>Suggested-by: Mark Pearson <mpearson-lenovo@squebb=2Eca>
>Link: https://msgid=2Elink/9789f452-d7eb-4f1e-8a13-7335332193a7@app=2Efas=
tmail=2Ecom
>Suggested-by: Derek J=2E Clark <derekjohn=2Eclark@gmail=2Ecom>
>Link: https://msgid=2Elink/782FE636-A06A-4E12-9563-786374805947@gmail=2Ec=
om
>Signed-off-by: Rong Zhang <i@rong=2Emoe>
>---
>Changes in v2:
>- Add PATCH 1 ("platform/wmi: Introduce wmidev_exists()") to the series
>  as discussed at https://msgid=2Elink/83776200-4A60-4756-A99F-D5A3BB4D83=
4A@rong=2Emoe
>- Add PATCH 2 ("lenovo-wmi-capdata: Do not stop the AC notifier chain on
>  error") to the series, as adopting the new WMI API will intentionally
>  catch more faulty firmware and propagate more errors
>- Synchronize mutex initialization with release-acquire barriers (thanks
>  Ilpo J=C3=A4rvinen)
>- Refine line wrap (ditto)
>- Replace the term "poison" with "stub" (ditto)
>- Add PATCH 10 ("platform/x86: lenovo-wmi-capdata: Do not match missing
>  components") to the series to solve the report made by Navon
>- Update outdated comments, function documentations and commit messages
>- Link to v1: https://patch=2Emsgid=2Elink/20260914-lwmi-wmi-new-api-v1-0=
-7a400f2f69f8@rong=2Emoe
>
>---
>Armin Wolf (1):
>      platform/wmi: Introduce wmidev_exists()
>
>Rong Zhang (11):
>      platform/x86: lenovo-wmi-capdata: Do not stop the AC notifier chain=
 on error
>      platform/x86: lenovo-wmi-capdata: Only allocate sub-master info whe=
n necessary
>      platform/x86: lenovo-wmi-capdata: Store a pointer to component info
>      platform/x86: lenovo-wmi-capdata: Defer mutex initialization
>      platform/x86: lenovo-wmi-{capdata,other}: Only allocate capdata lis=
t when necessary
>      platform/x86: lenovo-wmi-capdata: Adopt new WMI API
>      platform/x86: lenovo-wmi-capdata: Register component even on WMI er=
ror
>      platform/x86: lenovo-wmi-capdata: Detect stubbed capdata device
>      platform/x86: lenovo-wmi-capdata: Do not match missing components
>      platform/x86: lenovo-wmi-helpers: Adopt new WMI API
>      MAINTAINERS: Add myself as a LENOVO drivers co-maintainer
>
> MAINTAINERS                               |   1 +
> drivers/platform/wmi/core=2Ec               |  33 ++-
> drivers/platform/x86/lenovo/wmi-capdata=2Ec | 450 ++++++++++++++++++++++=
--------
> drivers/platform/x86/lenovo/wmi-helpers=2Ec |  61 ++--
> drivers/platform/x86/lenovo/wmi-other=2Ec   |  24 +-
> include/linux/wmi=2Eh                       |   3 +
> 6 files changed, 400 insertions(+), 172 deletions(-)
>---
>base-commit: af32da41b0327b9c6a37856ba82b6760d6c8d10e
>change-id: a504a929-lwmi-wmi-new-api-f5344d48a86a
>
>Thanks,
>Rong
>

