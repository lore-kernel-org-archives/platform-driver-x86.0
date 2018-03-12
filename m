From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Dell Inc. XPS 13 9343/0TM99H fails to boot v4.16-rc5
Date: Mon, 12 Mar 2018 19:53:57 +0100
Message-ID: <20180312185357.GA1672@light.dominikbrodowski.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org, mario.limonciello@dell.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Mario,

unfortunately, my Dell Inc. XPS 13 9343/0TM99H, BIOS A11 12/08/2016 fails to
boot v4.16-rc5. More exactly, I could bisect it down to commit 25d47027e10
("platform/x86: dell-smbios: Link all dell-smbios-* modules together").
Usually, I have enabled

CONFIG_SENSORS_DELL_SMM=y
CONFIG_DELL_SMBIOS=y
CONFIG_DELL_SMBIOS_WMI=y
CONFIG_DELL_SMBIOS_SMM=y
CONFIG_DELL_LAPTOP=y
CONFIG_DELL_WMI=y
CONFIG_DELL_WMI_DESCRIPTOR=y
# CONFIG_DELL_WMI_AIO is not set
# CONFIG_DELL_WMI_LED is not set
# CONFIG_DELL_SMO8800 is not set
# CONFIG_DELL_RBTN is not set
# CONFIG_DELL_RBU is not set

For v4.16-rc5 to work, I need to manually disable DELL_SMBIOS_WMI:

-CONFIG_DELL_SMBIOS_WMI=y
+# CONFIG_DELL_SMBIOS_WMI is not set

Any ideas?

Thanks,
	Dominik
