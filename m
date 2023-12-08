Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GEcxBhVy"
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29020E0;
	Fri,  8 Dec 2023 03:20:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702034407; x=1733570407;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=4YJNWIeDFXGfBSV+TfrZNDSV2cxP9VEzfo0ouf4VjzE=;
  b=GEcxBhVy8VuV+2iBI7wVV6QfHcZkLHy4SCWc/S4tr4wduqzjglYd8WK/
   CB4UHIE/MTznSJAhap7+MumvQ/mF/haW2hq6Ir8Cp2MmlkHnSieNIU8Rz
   MmoAUuYtVEs6xB8rzTTNh7S9u7uvsd8R61sOeg2WBnb4TABhLky3EV8U6
   oTQ9pxdk8mIs+LAsVysndnsC3EuT4nqNxCw9kTgU7RvV1psXVqNcF3P5I
   NKzXVTxLraEFUrx4SHLVTtrlx4r1hxpAz1yPLnVUf7ClalxLQdrUvAHQl
   X3EUBkGFCS+51ASLWeEratE012ocWZsnh0x5ZvfyGXryXDmSYTtqJ++Cq
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="480588487"
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; 
   d="scan'208";a="480588487"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2023 03:20:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; 
   d="scan'208";a="20047847"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.246.49.180])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2023 03:20:04 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: linux-kernel@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
Cc: Henrique de Moraes Holschuh <hmh@hmh.eng.br>, 
 Hans de Goede <hdegoede@redhat.com>, ibm-acpi-devel@lists.sourceforge.net, 
 platform-driver-x86@vger.kernel.org
In-Reply-To: <20231206060144.8260-1-rdunlap@infradead.org>
References: <20231206060144.8260-1-rdunlap@infradead.org>
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: fix kernel-doc warnings
Message-Id: <170203439844.2193.17545249753368033460.b4-ty@linux.intel.com>
Date: Fri, 08 Dec 2023 13:19:58 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3

On Tue, 05 Dec 2023 22:01:43 -0800, Randy Dunlap wrote:

> Add a function's return description and don't misuse "/**" for
> non-kernel-doc comments to prevent warnings from scripts/kernel-doc.
> 
> thinkpad_acpi.c:523: warning: No description found for return value of 'tpacpi_check_quirks'
> thinkpad_acpi.c:9307: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
> thinkpad_acpi.c:9307: warning: missing initial short description on line:
>  * This evaluates a ACPI method call specific to the battery
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo branch. Note it will show up in the public
platform-drivers-x86/review-ilpo branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: thinkpad_acpi: fix kernel-doc warnings
      commit: 17fe3ec0c110b4afc04052e2a33b146766aac8a1

--
 i.

