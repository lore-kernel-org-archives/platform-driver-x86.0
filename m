Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EFD73D34BB
	for <platform-driver-x86@vger.kernel.org>; Mon, 19 Oct 2026 07:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792396140; cv=none; b=mxujOBq94jnvZmWBi8k8G1KbcXATYVq53meMA/FY6ph0WYW0CuF2ob6y+IfrzLidj3lFfslc1ceYxON9+ZaBmhlI5U8lIpwMGfi3tE/h0U29pEWpaSnqDUn8H1Ul4nvPLUP+anw0+Rtsk9yDvSEGz38xjvfhNFhHNNgJRkjgKxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792396140; c=relaxed/simple;
	bh=HOO9uaduFPE0IroXVdESFXNKO0zP9kAwjlqcqX6X7/E=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=i48n2W3efMa2inhgI4xJlFe0QDZhG/n6ZMl1xBEbxBKcDMHckk3brF7+D8UfMsurd26aZKIYjgHd13gRXxNO4PZlfonkM+bFoS1QYVCk1W8t5XSzQgi7Su0oIjuTLLuIm1A2P+8xf5L11nSXfVHzGSI/WYgPV1G0sR2mKaGXIGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xmd//BeQ; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xmd//BeQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792396139; x=1823932139;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=HOO9uaduFPE0IroXVdESFXNKO0zP9kAwjlqcqX6X7/E=;
  b=Xmd//BeQXwDaVqjRkwfw4euON+JnP4P8XXU0IsnlQHgJRSDC95n8h7y0
   VKVORhkn0N27yMz+Q+MblS+Zl2EhlQ6KJGU0UMnKhsHsUUlMBMoHx1nxE
   9ZloXonrqTKn0L7JVyQEia0uYvH6ceZ7uCCFHvAfM5rFcaQAq0K9ovxvm
   NSL7M7ZpD9EUHjD0IyGlrTXOX2aHDjka13Bnoj/3jlEtzb2uyAn2qPRYM
   bKtWiODcho5gLRk32JtkAhYHBJrr7pEAAtn+0WCxijC5Qi0gTUfKWImWW
   A5Tz3gjpMTKuSLkVqgeZ6gUcqP7W3stzYJ6sJ/dxI6EB5hzTrWQEzG3p+
   w==;
X-CSE-ConnectionGUID: ZC1jbwR2R+CPvmDuNqSX7w==
X-CSE-MsgGUID: GNEqNY9oQ9iqTyoMVnFklg==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="975745"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="975745"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 00:48:58 -0700
X-CSE-ConnectionGUID: 48Y8PPwUTV+uKwpQHxnJAA==
X-CSE-MsgGUID: 6IDAtbAmTeGSPHtgyrVXXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="4253456"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.177])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 00:48:56 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 19 Oct 2026 10:48:51 +0300 (EEST)
To: Felix Radensky <fradensky@nvidia.com>
cc: Hans de Goede <hansg@kernel.org>, Vadim Pasternak <vadimp@nvidia.com>, 
    platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH platform-next v2 0/3] platform/mellanox: Add nvsw core
 and SPC6 host driver
In-Reply-To: <20261018101156.699575-1-fradensky@nvidia.com>
Message-ID: <274bb540-5f61-d343-173b-a2f46f7ea69a@linux.intel.com>
References: <20261018101156.699575-1-fradensky@nvidia.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 18 Oct 2026, Felix Radensky wrote:

> This series adds support for system control and monitoring on Nvidia
> SPC6 based switches, through the CPLD/FPGA devices attached to the host
> CPU.
> 
> Patch 1 adds nvsw-core, which implements the register map setup, the I2C
> mux topology and the creation of the mlxreg-* platform devices shared by
> all Nvidia switch board drivers. Patch 2 adds nvsw-host-spc6, the first
> user of that core, covering the liquid cooled systems, along with
> documentation for the register access attributes it exposes. Patch 3
> adds the air cooled SPC6 systems, which unlike the liquid cooled ones
> carry their own power supplies and fan drawers.
> 
> The functionality covered is component resets and reset cause
> reporting, mux selection for hardware components, general purpose
> registers, LED control, watchdog control, and fan control on the
> systems that have fans. The core also creates an mlxreg-hotplug device
> for boards that describe one; no SPC6 system does, and that path comes
> into use with the BMC driver mentioned below.
> 
> Why a new core instead of extending mlx-platform
> ================================================
> 
> The obvious question is why this does not go into mlx-platform.c, which
> already serves the existing Mellanox switch generations. There are two
> reasons.
> 
> The first is that mlx-platform.c cannot reach this hardware. It is
> built around a single memory mapped LPC window: it calls
> devm_ioport_map() once, hands the resulting base to devm_regmap_init()
> with its own ioread8()/iowrite8() callbacks, and every system it
> supports is described in terms of offsets into that window. On SPC6 the
> CPLD is not on the LPC bus at all, it is an I2C device, and the driver
> reaches it with devm_regmap_init_i2c() through a client on the host I2C
> tree. Supporting SPC6 in mlx-platform.c would mean giving it a second,
> parallel register access path and making its register map setup
> conditional, which is a larger and more invasive change than adding a
> separate driver.
> 
> The same applies beyond SPC6. The identical CPLD register layout is
> also managed from an ARM Baseboard Management Controller, where the
> device is reached over I2C in the same way but is described in device
> tree rather than discovered through DMI. nvsw-core holds only the parts
> that do not depend on how the board was found, so the register
> definitions and the mlxreg-* device descriptions are shared, and each
> board driver supplies its own instantiation. mlx-platform.c is
> inherently x86 and DMI bound and cannot serve the BMC side.
> 
> The second reason is structural. mlx-platform.c has grown to roughly
> 8600 lines covering 49 DMI matches, with the per-system description
> data and the device creation logic interleaved in a single translation
> unit. Adding another switch generation to it makes the file harder to
> review and makes it impossible to build support for one system without
> carrying the tables for all the others. nvsw splits the two concerns:
> the core holds the logic (760 lines) and each board driver holds only
> its own description data, so a kernel can be built with just the boards
> it needs.
> 
> The core is not speculative generality. The SPC6 host driver in this
> series is its first user, and we intend to submit a BMC driver and an
> NVL7 host driver on top of it once the core has been reviewed.
> 
> Why the SPC6 driver is split over two patches
> =============================================
> 
> Patches 2 and 3 add a single driver, split along a hardware line
> rather than chopped into arbitrary pieces. Patch 2 is complete and
> useful on its own: it covers the liquid cooled SPC6 systems, which
> shipped first. Patch 3 adds the air cooled systems, which arrived
> later and expose a different set of CPLD attributes because they carry
> their own power supplies and fan drawers.
> 
> Most of both patches is register description data, and the two sets
> are largely disjoint. Folding them together would give a single patch
> of roughly 1800 lines in which two unrelated board descriptions are
> interleaved, with nothing in the diff to indicate which attribute
> belongs to which system.
> 
> Patch 3 is purely additive: it does not modify or remove a single line
> introduced by patch 2. The per SKU description struct and the
> driver_data based DMI dispatch are introduced in patch 2, so patch 3
> adds only the new register definitions, the new board description and
> the DMI entry that selects it.
> 
> On the shared "mlxplat" platform device name
> ============================================
> 
> nvsw-host-spc6 registers its platform device as "mlxplat", the same
> name used by mlx-platform.c. This is deliberate. The mlxreg-io
> attributes are a long standing userspace ABI documented in
> Documentation/ABI/stable/sysfs-driver-mlxreg-io, and the management
> software reads them from
> /sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/. Keeping the name
> keeps those paths stable across switch generations, so existing tooling
> works unchanged on SPC6.
> 
> The two drivers cannot collide at runtime: each calls dmi_check_system()
> and returns -ENODEV before registering anything, and their DMI tables
> are disjoint, so on any given system exactly one of them instantiates.
> If you would still rather the new driver used a distinct name, we can
> change it, but it would mean a new sysfs path and a userspace ABI break
> for the affected systems.
> 
> Symbol namespace
> ================
> 
> The two symbols the core exports to its board drivers are exported as
> EXPORT_SYMBOL_NS_GPL() in the NVSW namespace, so that the core does not
> add anything to the global symbol table and the dependency is explicit
> in each consumer via MODULE_IMPORT_NS().
> 
> Testing
> =======
> 
> Built on x86_64 against pdx86/for-next with gcc W=1 and with clang 17
> W=1 plus CONFIG_WERROR, both warning free, at every patch in the
> series. Checked with sparse v0.6.5-rc1, smatch and the coccinelle
> report mode scripts, all clean. checkpatch --strict reports
> no errors and no checks. Module linkage and the namespace import were
> verified with modpost and modinfo.
> 
> v1->v2
> Comments pointed out by Ilpo:
> - Add the direct includes for the macros the two drivers use rather
>   than relying on them arriving transitively: linux/array_size.h for
>   ARRAY_SIZE, linux/bits.h for BIT and GENMASK, linux/err.h for IS_ERR
>   and PTR_ERR and linux/dev_printk.h for the dev_*() helpers, plus
>   linux/export.h and linux/types.h in the core.
> - Remove the redundant NULL assignments from the error paths. The
>   registration helpers now return into a local variable, so a struct
>   nvsw_core field is only ever assigned a valid pointer and never an
>   ERR_PTR, which is what the NULL stores were papering over. 19 of the
>   23 assignments are gone; the 4 that remain are on the two module
>   scope pointers in nvsw-host-spc6, which outlive a failed probe.
> - Rework the rollback in nvsw_core_platform_init() and
>   nvsw_host_spc6_mux_topology_init() to be positional, and drop the
>   defensive pointer tests from the matching exit paths, which can no
>   longer see a partially initialised state.
> Additional fixes added by Felix:
> - Sort the include blocks in both drivers.
> Link to v1: https://lore.kernel.org/platform-driver-x86/20261008061704.794379-1-fradensky@nvidia.com/
> 
> Felix Radensky (3):
>   platform/mellanox: nvsw-core: Add core driver for Nvidia switches
>   platform/mellanox: nvsw-host-spc6: Add driver for Nvidia SPC6 switches
>   platform/mellanox: nvsw-host-spc6: Add support for SPC6 air cooled
>     switches

Also please check what sashiko.dev has to say about these patches.

Note that sashiko is an AI review tool so please apply healthy bit of 
critisism to any of its findings.

-- 
 i.

