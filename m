From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Apr 19 (dell smbios SMM)
Date: Thu, 19 Apr 2018 10:59:32 -0700
Message-ID: <6aec5528-d6f1-3e05-1ac2-6eddbd0ac64f@infradead.org>
References: <20180419143545.63c0c639@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180419143545.63c0c639@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Mario Limonciello <mario.limonciello@dell.com>
List-Id: platform-driver-x86.vger.kernel.org

On 04/18/18 21:35, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20180418:
> 


I see some patches from about 1 month ago for this, but it was either
never fixed ... or it's back.


on x86_64:

WARNING: unmet direct dependencies detected for DELL_SMBIOS
  Depends on [m]: X86 [=y] && X86_PLATFORM_DEVICES [=y] && (DCDBAS [=m] || DCDBAS [=m]=n) && (ACPI_WMI [=n] || ACPI_WMI [=n]=n)
  Selected by [y]:
  - DELL_LAPTOP [=y] && X86 [=y] && X86_PLATFORM_DEVICES [=y] && DMI [=y] && BACKLIGHT_CLASS_DEVICE [=y] && (ACPI_VIDEO [=n] || ACPI_VIDEO [=n]=n) && (RFKILL [=n] || RFKILL [=n]=n) && SERIO_I8042 [=y]


drivers/platform/x86/dell-smbios-smm.o: In function `dell_smbios_smm_call':
dell-smbios-smm.c:(.text+0x7d): undefined reference to `dcdbas_smi_request'


-- 
~Randy
