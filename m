Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A20222D2486
	for <platform-driver-x86@vger.kernel.org>; Thu, 15 Oct 2026 23:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792108259; cv=none; b=JAboFtZzBZCFSSVuCQoxR+zseLUP2/CvgpGi2CxKLtpxjKtby9G81A0p2GWYqkE3/oooB5nHY5P82ClJl+zYR8ruje876VcPfH0M+8YhEbJs5ho7wYqAMELptbn1yL5HcYXHB4xl6KZmFohS8fVjf3Fm5casDNnB5YynsCnJjT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792108259; c=relaxed/simple;
	bh=GANNJTrrPVR7deBPiYxEg1r72QFifvY1nBYgf+d+/zo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HK26f3Iz7c/MK5Qdc6XLbL+RTbECzcpRf5Bw+W6aEdter+N4NXpV+2Ak2NVqyYZdozTpzNJ4YAMIcia3pVY5kHpZ3kWUZa6BDkS0m8lcMDo+v0u7zT6klfDNfXayJt5ZMuXrP9C+yIQvbZeSUFVepcb2TRwH1jtvqC19mP8Rg1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=dIoFoDWE; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="dIoFoDWE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1792108254; x=1792713054; i=w_armin@gmx.de;
	bh=v90V2GiGUNY5y9rWYZDOt/LF07VCTwPPmLeY6NzWMUI=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=dIoFoDWEjSImOfz5deKHrSFMeVNnstV6G8aUB3x3hlSxSSerLqvZlho62sa9Pm1B
	 eR5bY5vzDOzdCygxYyd/U4renO9yPVR3OhBLNOpYpHhA5oS2He8vPTYRt/4GOI/uy
	 ciYVtPFPJ3XIjfrS8I0pJFQBgXckOeAcBX64Z6TSBgohGNp6nlSSG0qp+DjXyl9rP
	 60e03dTm7xYPoRVA39C4L4e4vwqwOjQIWzOGK+qgR9B4ItNYNrg0A9xbXGWQlrAV7
	 1d0IP6fSf89bxNuBogvHlui3i0nQy37W4WtW9bLFfq6ixKB1NWcwlHcDNiwvwv5x6
	 CQ61ll+7qy2MLLrHPg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MaJ7v-1x52Tr2dOP-00NaF3; Fri, 16
 Oct 2026 01:50:54 +0200
Message-ID: <813fe457-80bd-4642-9ff9-c3df0c213f05@gmx.de>
Date: Fri, 16 Oct 2026 01:50:53 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] platform/x86/amd/wmi: aod: Document the WMI interface
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, mario.limonciello@amd.com
References: <20261010190543.563161-1-Shyam-sundar.S-k@amd.com>
 <20261010190543.563161-4-Shyam-sundar.S-k@amd.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20261010190543.563161-4-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:vAEsCw4fX715DPY1IVF5xKQZVBdKUEZRGecx1klm5SiD824yeqf
 zfpIE7J6xphyEZEfCXTN8DKwRTdZwIqD+/9U4eZo/hBqD8jRtQNzVZ1bgpBuKvPVCY963bG
 z4GG989dmK81F6EQzpTMGCqF5hbnCs2N9CQ/kFFjcD0R3RGTlW3ELXjHiqDCtuRi1490/v3
 pJDj0mXe+cJO7WLEfDRNg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:x+qcgRkAS+E=;CFBMXaCp0pGBIaZ8PaBoDQVYJ8S
 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
 P7Ln/AiAWeU=

Am 10.10.26 um 21:05 schrieb Shyam Sundar S K:

> Describe the AMD Overclocking WMI interface, the commands used for the
> sysfs attributes and the debugfs interface.
>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>   Documentation/wmi/devices/amd-wmi-aod.rst | 291 ++++++++++++++++++++++
>   MAINTAINERS                               |   1 +
>   2 files changed, 292 insertions(+)
>   create mode 100644 Documentation/wmi/devices/amd-wmi-aod.rst
>
> diff --git a/Documentation/wmi/devices/amd-wmi-aod.rst b/Documentation/w=
mi/devices/amd-wmi-aod.rst
> new file mode 100644
> index 000000000000..c75a8d11d8c9
> --- /dev/null
> +++ b/Documentation/wmi/devices/amd-wmi-aod.rst
> @@ -0,0 +1,291 @@
> +.. SPDX-License-Identifier: GPL-2.0-or-later
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +AMD Overclocking WMI driver (amd-wmi-aod)
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Introduction
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +AMD Ryzen platforms implement the AMD Overclocking (AOD) interface
> +in the platform firmware. The firmware exposes it through a WMI device =
with
> +the GUID ``95F20B61-3D44-41F8-87E1-03CBF94C4E8F``. All platforms that
> +implement the AOD interface use this GUID. On Windows this interface is
> +used by AMD Ryzen Master.
> +
> +The interface is command based. The firmware reports a list of supporte=
d
> +commands, each with a numeric command ID and a property flag. Commands =
with
> +a linear range of values (property 1) report their minimum, maximum and=
 step
> +size, commands with discrete values (property 0) report the list of val=
ues
> +they accept. A new value is applied by executing the command.
> +
> +The firmware stores new values in its setup variables, so they only tak=
e
> +effect after a reboot. Some commands also report their current value, b=
ut
> +this depends on the firmware: on the systems tested so far the memory c=
lock
> +and SMT report their current value, the PPT, TDC and EDC limits do not.
> +
> +The driver exposes a selected set of these commands as sysfs attributes=
,
> +see Documentation/ABI/testing/sysfs-platform-amd-wmi-aod. An attribute =
is
> +only created if the firmware lists the matching command. All attributes
> +call into the firmware and are only accessible by root. More attributes
> +can be added later as needed.
> +
> +WMI interface description
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> +
> +The WMI interface description can be decoded from the embedded binary M=
OF
> +(bmof) data using the `bmfdec <https://github.com/pali/bmfdec>`_ utilit=
y.
> +Only the WMI methods and data classes used by the driver are shown here=
:
> +
> +::
> +
> +  [WMI,
> +   Locale("MS\\0x409"),
> +   Description("This class contains the definition of the package used =
in other classes"),
> +   guid("{ABBC0F58-8EA1-11d1-00A0-C90629100000}")
> +  ]
> +  class OIDPackage
> +  {
> +      [WmiDataId(1),
> +       read, write,
> +       Description("Number of ID")
> +      ] uint8 Length;
> +      [WmiDataId(2),
> +       read, write,
> +       Description("64*4 bytes of data")
> +      ] uint32 ID[64];
> +      [WmiDataId(3),
> +       read, write,
> +       Description("64*4 bytes of data")
> +      ] uint32 property[64];
> +      [WmiDataId(4),
> +       read, write,
> +       Description("64 strings")
> +      ] string IDstring[64];
> +  };
> +
> +  [WMI,
> +   Locale("MS\\0x409"),
> +   Description("This class contains the definition of the package used =
in other classes"),
> +   guid("{ABBC0F65-8EA1-11d1-00A0-C90629100000}")
> +  ]
> +  class GetdValuesPackage
> +  {
> +   [WmiDataId(1),
> +       read, write,
> +       Description("ID")
> +      ] uint32 ID;
> +   [WmiDataId(2),
> +      read, write,
> +      Description("Current")
> +      ] uint32 Current;
> +   [WmiDataId(3),
> +       read, write,
> +       Description("Number of ID")
> +      ] uint32 Length;
> +   [WmiDataId(4),
> +       read, write,
> +       Description("100*4 bytes of data")
> +      ] uint32 DValuesBuffer[100];
> +  };
> +
> +  [WMI,
> +   Locale("MS\\0x409"),
> +   Description("This class contains the definition of the package used =
in other classes"),
> +   guid("{7BF6AE1F-85CC-4ee5-94FD-394B5FE7E710}")
> +  ]
> +  class OutBuffer
> +  {
> +   [WmiDataId(1),
> +       read, write,
> +       Description("ID")
> +      ] uint8 result[200];
> +  };
> +
> +  [WMI,
> +   Locale("MS\\0x409"),
> +   Description("This class contains the definition of the package used =
in other classes"),
> +   guid("{ABBC0F63-8EA1-11d1-00A0-C90629100000}")
> +  ]
> +  class GetMinMaxSteppingPackage
> +  {
> +      [WmiDataId(1),
> +          read, write,
> +          Description("ID")
> +          ] uint32 Value;
> +          [WmiDataId(2),
> +           read, write,
> +           Description("Current")
> +          ] uint32 Current;
> +          [WmiDataId(3),
> +           read, write,
> +           Description("Min")
> +          ] uint32 Min;
> +          [WmiDataId(4),
> +           read, write,
> +           Description("Max")
> +          ] uint32 Max;
> +          [WmiDataId(5),
> +           read, write,
> +           Description("Stepping")
> +          ] uint32 Stepping;
> +  };
> +
> +  [WMI,
> +   Dynamic,
> +   Provider("WmiProv"),
> +   Locale("MS\\0x409"),
> +   Description("Class to Query/Set a CLKValue"),
> +   guid("{95F20B61-3D44-41F8-87E1-03CBF94C4E8F}")
> +  ]
> +  class AMD_ACPI
> +  {
> +      [key, read]
> +       string InstanceName;
> +      [read] boolean Active;
> +
> +      [WmiMethodId(1),
> +       Implemented,
> +       read, write,
> +       Description("Get version")
> +      ] void QueryVersion([out,Description("version")]uint32 version);
> +
> +      [WmiMethodId(3),
> +       Implemented,
> +       read, write,
> +       Description("Get BIOS ACPI support function table.")
> +      ] void GetObjectID([out,Description("Get BIOS support Object ID t=
able")]OIDPackage pack);
> +
> +      [WmiMethodId(4),
> +       Implemented,
> +       read, write,
> +       Description("Bios request data")
> +      ] void Getdvalues([in,Description("ID used to identify")]uint32 I=
D,[out,Description("status")]GetdValuesPackage pack);
> +
> +      [WmiMethodId(5),
> +       Implemented,
> +       read, write,
> +       Description("Command Run")
> +      ] void RunCommand([in,Description("In buffer")]uint8 Inbuf[8],[ou=
t,Description("Out buffer")]OutBuffer Outbuf);
> +
> +      [WmiMethodId(6),
> +       Implemented,
> +       read, write,
> +       Description("Get Min/Max/Stepping values")
> +      ] void GetMinMaxSteppingValues([in,Description("ID used to identi=
fy")]uint32 ID,[out,Description("status")]GetMinMaxSteppingPackage pack);
> +
> +       [WmiMethodId(8),
> +       Implemented,
> +       read, write,
> +       Description("Get BIOS ACPI support function table2.")
> +      ] void GetObjectID2([out,Description("Get BIOS support Object ID =
table2")]OIDPackage pack);
> +  };

The MOF description is incomplete, please also add unused WMI methods and/=
or classes. However you do not need to explain them.

Thanks,
Armin Wolf

> +
> +WMI method usage
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +All WMI methods use instance 0. The firmware reads a 32-bit input argum=
ent
> +even for WMI methods that take no arguments, so the driver always passe=
s
> +at least a 32-bit argument. All integers are 32-bit little-endian value=
s.
> +
> +QueryVersion (method ID 1)
> +--------------------------
> +
> +Returns the version of the AOD interface implemented by the firmware as
> +a single integer.
> +
> +GetObjectID (method ID 3) and GetObjectID2 (method ID 8)
> +--------------------------------------------------------
> +
> +Return the list of supported general (GetObjectID) and overclocking
> +(GetObjectID2) commands as a package with 193 elements:
> +
> +- the number of valid entries
> +- 64 command IDs
> +- 64 property flags
> +- 64 command names as strings
> +
> +The driver uses both lists during probe to find out which of its sysfs
> +attributes are supported.
> +
> +Getdvalues (method ID 4)
> +------------------------
> +
> +Takes a command ID and returns the discrete values supported by this
> +command:
> +
> +- the command ID
> +- the current value
> +- the number of valid discrete values
> +- 100 discrete values
> +
> +RunCommand (method ID 5)
> +------------------------
> +
> +Takes a command ID and a new value, and applies the new value. The
> +firmware returns a 200 byte buffer, with the 32-bit status of the
> +operation (AodSmiStatus) located at offset 2. A status of 0 means
> +success.
> +
> +GetMinMaxSteppingValues (method ID 6)
> +-------------------------------------
> +
> +Takes a command ID and returns the range of values supported by this
> +command:
> +
> +- the command ID
> +- the current value, or 0 if the firmware does not report it
> +- the minimum value
> +- the maximum value
> +- the step size
> +
> +Commands with discrete values return all fields as 0. In the same way,
> +Getdvalues returns an ID and a length of 0 for commands with a linear r=
ange.
> +
> +The WMI methods 2 (Init), 7 (GetDimmSpdData), 9 (GetRmpData),
> +10 (GetOppTable), 11 (GetOppData) and 12 (GetMemoryProfile) are not use=
d
> +by the driver.
> +
> +Commands used by the driver
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D	=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D	=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D	=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> +Command ID	sysfs attribute		Firmware unit	sysfs unit
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D	=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D	=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D	=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> +0x00050001	ppt_limit		mW		uW
> +0x00050002	tdc_limit		mA		mA
> +0x00050003	edc_limit		mA		mA
> +0x00020001	mem_clock		MHz		MHz
> +0x00020026	smt_enable		0/1		0/1
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D	=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D	=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D	=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> +
> +Debugfs interface
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +For debugging and for tools that need access to commands without a
> +dedicated sysfs attribute, the driver exposes the raw WMI methods in
> +``/sys/kernel/debug/amd-wmi-aod-<device>/``. This interface is not a
> +stable ABI and is only accessible by root.
> +
> +``query_version``
> +  Reads the AOD interface version.
> +
> +``get_object_id``, ``get_object_id2``
> +  Read the command lists in text form, one line per command.
> +
> +``get_object_id_raw``, ``get_object_id2_raw``
> +  Read the command lists as a 4612 byte binary structure: the number of
> +  entries (u32), 64 command IDs (u32), 64 property flags (u32) and 64
> +  NUL-terminated command names of 64 bytes each. The firmware is querie=
d
> +  when the file is read.
> +
> +``get_dvalues``, ``get_minmax_stepping``
> +  Write a command ID, then read the result of Getdvalues or
> +  GetMinMaxSteppingValues for this command.
> +
> +``run_command``
> +  Write ``"<command id> <value>"`` to execute a command.
> +
> +``run_command_status``
> +  Reads the status reported by the firmware for the last command execut=
ed
> +  using ``run_command``.
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d069d02665e2..0a3b81e59142 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1340,6 +1340,7 @@ M:	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>   L:	platform-driver-x86@vger.kernel.org
>   S:	Supported
>   F:	Documentation/ABI/testing/sysfs-platform-amd-wmi-aod
> +F:	Documentation/wmi/devices/amd-wmi-aod.rst
>   F:	drivers/platform/x86/amd/wmi/
>  =20
>   AMD XDNA DRIVER
