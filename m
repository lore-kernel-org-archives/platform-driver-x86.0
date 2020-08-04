From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: [PATCH] platform/x86:dell-laptop:Add battery charging thresholds
 and charging mode switch.
Date: Tue, 4 Aug 2020 06:53:43 +0100
Message-ID: <20200804055343.mmkypi272sgfx6al@srcf.ucam.org>
References: <20200729065424.12851-1-Perry_Yuan@Dell.com>
 <202008011345.5O4q2hta%lkp@intel.com>
 <SJ0PR19MB45281A4375E622F69642B526844A0@SJ0PR19MB4528.namprd19.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <SJ0PR19MB45281A4375E622F69642B526844A0@SJ0PR19MB4528.namprd19.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Yuan, Perry" <Perry.Yuan@dell.com>
Cc: kernel test robot <lkp@intel.com>, "sre@kernel.org" <sre@kernel.org>, "pali@kernel.org" <pali@kernel.org>, "dvhart@infradead.org" <dvhart@infradead.org>, "andy@infradead.org" <andy@infradead.org>, "Limonciello, Mario" <Mario.Limonciello@dell.com>, "kbuild-all@lists.01.org" <kbuild-all@lists.01.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Aug 04, 2020 at 05:46:30AM +0000, Yuan, Perry wrote:

> It is not patch issue, the kernel config needs to add  "CONFIG_ACPI_BATTERY=y"

In that case you probably want to add a dependency to ACPI_BATTERY in 
the DELL_LAPTOP Kconfig.

-- 
Matthew Garrett | mjg59@srcf.ucam.org
