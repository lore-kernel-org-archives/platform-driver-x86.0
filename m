Received: from mail-43103.protonmail.ch (mail-43103.protonmail.ch [185.70.43.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF497457E64
	for <platform-driver-x86@vger.kernel.org>; Thu,  1 Oct 2026 08:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790842428; cv=none; b=fLpHjLroFZQ0BdpOYG3k8EKXkmTFNEcGWlReTAzDXGZIETWQnBmUlIC6GQ2PEbAsVUaXdmoQGJCkauXLOcPPbnyIpqEjyC89YcCwMIJSj2iMvuK/tgBSJGTNSA68iOg8mC0lglPUh7z7om41L6y+/+l87TLmIcEL9KPMjVMBpk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790842428; c=relaxed/simple;
	bh=IjWrkcLXoUEfIGgEXapRN2vFNk6RPCVqKnL39koXebo=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HqK5Dj1orGLn8tIAhcSHNfv6QUMmocqIzkAx3CMzHOhEJeuyaq9lrkuJOjFcsFwsx0y/ak6Z5z6s4EeF8yJXcdd7+zlJVgtZY3Mo5sB9hK8xqiPZrXiuh0ThGY1FOPcHOQ5BPyMCoCGqzPnf6evUBLFQ8OWBaRJtxdKkU5cG7oM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=w9pxAkH3; arc=none smtp.client-ip=185.70.43.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="w9pxAkH3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1790842400; x=1791101600;
	bh=UZ4lFIwjYICUAj0zWJqVE0RVgAFSpjygmb/Fgdt8/20=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=w9pxAkH3ufmf+j6ntOk4OuyNU47Dz81/DTrUgGLeZveowaxnjeXblh0wjdQjy5dtI
	 hvCnJ98wL34yfAZhF73jn2PjpzS7YLtM107dfJr7SHGGPegCPgKeQutlqRwfzsflRD
	 deuvMCbOpHovNVj74I1Hzt/SYOQb6um4D0edpqXxrQqIEij0mEe11q1aUQkW1mucWB
	 sJoCkUDRjDzvoLQiVP7XiwYItbuNNjL2yiW5byVbxfACq1mF8Y0Nsa25QXATL0aGQ7
	 Th13D4S0MXRd5+XW/PPv+IEy5KB6EIScgYMVVB1sGDUsYHR41d1Ard1aggRvKE2PaZ
	 +p/MQulDtAM4Q==
Date: Thu, 01 Oct 2026 08:13:17 +0000
To: "Nirujogi, Pratap" <pnirujog@amd.com>
From: "caspar.adriani" <caspar.adriani@proton.me>
Cc: Pratap Nirujogi <pratap.nirujogi@amd.com>, Benjamin Chan <benjamin.chan@amd.com>, "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, Hans de Goede <hansg@kernel.org>, "Adam J. Sypniewski" <ajsyp@syptech.net>
Subject: Re: [RFC] AMD ISP4: OV13B10 (OMNI13B1) rear camera on ASUS ROG Flow Z13 GZ302 - ISP comes up, SET_STREAM_CONFIG fails with error 6
Message-ID: <P9m7agZFwqTsT5eczqDOuUVoP-lGl6Nd8FLvknyAj7gm7R_4cwIpb2_3-DNis287elaS_x5ummKLdOf_rk7LcHZqnrTnjMuzEPcX2syIefg=@proton.me>
In-Reply-To: <ea758386-13b0-4667-8eca-9aa4efefe92b@amd.com>
References: <lWYl1YJwDSh-q2Ew2f8b0BweQ4V-SUnPMSMurU5gT1LkqVdrmWFunj0sSgjC7m66bORBAD_jRCFTt1_ZOkotOMukY46rI4ayYbIfPQq4E9U=@proton.me> <ea758386-13b0-4667-8eca-9aa4efefe92b@amd.com>
Feedback-ID: 135490423:user:proton
X-Pm-Message-ID: 45ae907570821e94044bcc9781cd1237845990bf
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Hi Pratap,

Thank you for the quick and thorough reply. That clears everything up.
Knowing that error 6 is UNSUPPORTED_SENSOR, and that the firmware
handles sensor power and clocks during SET_STREAM_CONFIG, explains
exactly what I was seeing. I won't spend more time on kernel-side
workarounds.

I've dropped the local patches and will wait for OV13B10 firmware
support or the sensor-agnostic ISP4 driver. The offer to test still
stands: I have a GZ302 available and can try firmware or driver draftswhene=
ver they're ready.

Thanks again to you and the team for the work on ISP4.

Best regards,
Caspar


Sent with Proton Mail secure email.

On Wednesday, September 30th, 2026 at 22:41, Nirujogi, Pratap <pnirujog@amd=
.com> wrote:

> Hi Caspar,
>=20
> On 9/28/2026 10:45 AM, caspar.adriani wrote:
> >
> > You don't often get email from caspar.adriani@proton.me. Learn why this
> > is important <https://aka.ms/LearnAboutSenderIdentification>
> >
> >
> >
> > Caution: This message originated from an External Source. Use proper
> > caution when opening attachments, clicking links, or responding.
> >
> >
> > Hi,
> >
> > This is a status report plus questions about getting the rear camera of
> > the ASUS ROG Flow Z13 2025 (GZ302, Strix Halo) working with the upstrea=
m
> > AMD ISP4 stack. In the ISP4 v6 thread [1] GZ302 / OMNI13B1 support was
> > described as a TODO for after the HP ZBook Ultra G1a support landed. I
> > have been experimenting with it and got part of the way. The remaining
> > blocker appears to be in firmware or board wiring that I cannot see
> > from outside, so I would appreciate some pointers.
> >
> > Kernel: v7.2.8 (stable), plus the local patch below
> > Firmware: amdgpu/isp_4_1_1.bin from linux-firmware (as shipped by NixOS=
)
> >
> Thank you for sharing the status of your OV13B10 enablement work with
> the AMD ISP4 driver.
>=20
> You made good progress toward bringing up the sensor; however, the
> OV13B10 has several dependencies on the ISP firmware, which means it is
> not compatible with the currently upstreamed AMD ISP4 driver and
> firmware implementation.
>=20
> The original objective was to keep the AMD ISP4 driver sensor-agnostic.
> Consistent with that approach, the x86/platform driver and OV05C10
> sensor driver patches were submitted upstream [1]. However, during the
> AMD ISP4 driver review process, feedback from upstream reviewers led to
> a change in direction. Reviewers recommended to keep the sensor access
> exclusive to the host or FW, this led to adopting a webcam-style driver
> model because certain sensor-specific AEC-related registers are accessed
> directly by the firmware.
>=20
> [1] OV05C10 driver patch discussion on the Linux kernel mailing list:
> https://lore.kernel.org/all/60cf7590-4fd8-419b-a782-8bc89fb5395a@kernel.o=
rg/
>=20
> Based on this feedback, support for the OV05C10 sensor was moved
> entirely into the firmware so that sensor control is handled exclusively
> by the firmware rather than being split between the x86 driver and
> firmware. As a result, the currently upstreamed firmware image
> (amdgpu/isp_4_1_1.bin) is OV05C10-specific, and the upstream AMD ISP4
> driver support is limited to the HP ZBook Ultra G1a 14-inch Mobile
> Workstation PC platform.
>=20
> We are actively working toward a sensor-agnostic ISP4 driver
> architecture. Until that effort is completed and upstreamed, we do not
> plan to add support for additional platform and sensor combinations,
> including the GZ302 with the OV13B10 sensor.
>=20
> >
> > 1. Hardware / ACPI
> > ------------------
> >
> > The rear 13MP camera is an OmniVision OV13B10 on the ISP MIPI path.
> > amdgpu reports "detected ip block number 12 <isp_v4_1_1> (isp_ip)".
> > The front camera is a separate USB UVC module (0bda:636e) and is not
> > involved here.
> >
> > The sensor is described in an SSDT as \_SB_.CAMB:
> >
> >    Device (CAMB)
> >      {
> >          Name (_HID, "OMNI13B1")
> >          Name (_DDN, "OV13B-RGB")
> >          Name (_SUB, "OV13B")
> >          Name (_UID, "0")
> >          Name (_PLD, ...)          // PLD_Panel =3D "BACK"
> >          Method (_STA) { Return (0x0F) }
> >          Method (_DSM, 4)          // UUID f8fd3bff-21b7-4a99-bdc8-
> > c414a3e9453c
> >          {
> >              // Arg1 =3D=3D 0:
> >              //   func 0 -> Buffer { 0xEF }
> >              //   func 1 -> 0x07
> >              //   func 2 -> "3001"
> >              //   func 3 -> 1
> >              //   func 4 -> 1
> >              //   func 5 -> 0x10
> >              //   func 6 -> 0x0C
> >              //   func 7 -> 0x50
> >          }
> >      }
> >
> > There is no _CRS, so there are no I2C, GPIO or clock resources, the
> > same as OMNI5C10 on the HP. I read _DSM funcs 5/6/7 as the I2C
> > addresses of the sensor (0x10), the VCM (0x0C) and the EEPROM (0x50).
> > The VCM and EEPROM addresses are confirmed by the bus scan below; the
> > sensor address is not.
> >
> > Side note: the ov13b10 commit that added OMNI13B1 describes it as the
> > front-facing camera. On this unit _PLD says BACK, and the front camera
> > is the USB UVC module.
> >
> >
> > 2. What I changed
> > ------------------------------------------------------
> >
> > Unpatched, OMNI13B1 is missing from isp_sensor_ids[] in amdgpu_acpi.c.
> > amdgpu_acpi_get_isp4_dev() therefore fails, isp_v4_1_1_hw_init()
> > returns early, and no ISP MFD children are created. I added OMNI13B1
> > in the three places that currently key on OMNI5C10. The OV05C10 GPIO
> > lookup tables and swnode graph are reused unchanged: AMDI0030:00 pin 85
> > as "enable_isp", i2c address 0x10, 24 MHz, 2 lanes, 900 MHz.
> >
> > diff -ru a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c b/drivers/gpu/drm/
> > amd/amdgpu/amdgpu_acpi.c
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> > @@ -1588,6 +1588,7 @@
> >   #if IS_ENABLED(CONFIG_DRM_AMD_ISP)
> >   static const struct acpi_device_id isp_sensor_ids[] =3D {
> >    { "OMNI5C10" },
> > + { "OMNI13B1" }, /* ASUS ROG Flow Z13 (GZ302), OV13B10 */
> >    { }
> >   };
> >
> > diff -ru a/drivers/gpu/drm/amd/amdgpu/isp_v4_1_1.c b/drivers/gpu/drm/
> > amd/amdgpu/isp_v4_1_1.c
> > --- a/drivers/gpu/drm/amd/amdgpu/isp_v4_1_1.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/isp_v4_1_1.c
> > @@ -240,8 +240,9 @@
> >    return 0;
> >    }
> >
> > - /* add GPIO resources required for OMNI5C10 sensor */
> > - if (!strcmp("OMNI5C10", acpi_device_hid(acpi_dev))) {
> > + /* add GPIO resources required for OMNI5C10 / OMNI13B1 sensors */
> > + if (!strcmp("OMNI5C10", acpi_device_hid(acpi_dev)) ||
> > +   !strcmp("OMNI13B1", acpi_device_hid(acpi_dev))) {
> >    gpiod_add_lookup_table(&isp_gpio_table);
> >    gpiod_add_lookup_table(&isp_sensor_gpio_table);
> >    }
> > diff -ru a/drivers/platform/x86/amd/amd_isp4.c b/drivers/platform/x86/
> > amd/amd_isp4.c
> > --- a/drivers/platform/x86/amd/amd_isp4.c
> > +++ b/drivers/platform/x86/amd/amd_isp4.c
> > @@ -247,6 +247,12 @@
> >
> >   static const struct acpi_device_id amdisp_sensor_ids[] =3D {
> >    { AMDISP_OV05C10_HID, (kernel_ulong_t)&ov05c10_platform_config },
> > + /*
> > + * ASUS ROG Flow Z13 (GZ302): OV13B10 at i2c 0x10 per its _DSM. The IS=
P
> > + * firmware drives the sensor itself; the swnode graph is not consumed
> > + * by any in-tree driver, so the OV05C10 layout is reused as-is.
> > + */
> > + { "OMNI13B1", (kernel_ulong_t)&ov05c10_platform_config },
> >    { }
> >   };
> >   MODULE_DEVICE_TABLE(acpi, amdisp_sensor_ids);
> >
> > I also added a temporary dev_err() in isp4sd_fw_resp_cmd_done() that
> > prints isp4fw_error_code and the payload when cmd_status !=3D 0. Upstre=
am
> > currently drops both.
> >
> >
> > 3. What works with the patch
> > ----------------------------
> >
> > - amd_isp_capture.*.auto, amd_isp_i2c_designware.*.auto and
> >    amdisp-pinctrl.*.auto are created and bound.
> > - "AMDISP DesignWare I2C adapter" appears (i2c-24 here), and amd_isp4
> >    instantiates i2c-ov05c10 at 0x10 on it.
> > - amd_isp_capture registers /dev/videoN + /dev/mediaN (amd_isp41_mdev).
> > - On stream start:
> >        enable isp_subdev module
> >        ISP CCPU FW boot success
> >        send fw mem pool ... suc
> >        isp4fw_sensor_id 0, pipeId 0x5f91 EnableTnr 1
> >        channel:prev,fmt NV12,w:h=3D1920:1080,lp:1920,cp1920
> >    and the firmware acks SEND_BUFFER, SET_OUT_CHAN_PROP and
> >    ENABLE_OUT_CHAN with status 0.
> >
> >
> > 4. What fails
> > -------------
> >
> > SET_STREAM_CONFIG is rejected:
> >
> >    amd_isp_capture amd_isp_capture: fw cmd
> > ISP4FW_CMD_ID_SET_STREAM_CONFIG(0x02010001)
> >      seq 1 status 1 error_code 6 (0x0006) payload 00 00 00 ... 00 (36 x=
 00)
> >
> > The command at seq 16 (sent after the 4th buffer, which I take to be
> > START_STREAM) is never acked. No frame-done responses arrive.
> > With fw_log_enable=3D1 and dynamic debug on, the firmware log ring
> > produced no text.
> >
> > Secondary issue: after this, stopping the stream (closing the fd, or
> > killing the process) leaves the task in D state in
> > isp4sd_stop_stream() / vb2_fop_release() indefinitely. The kernel logs
> > "fail to disable stream" / "fail to stop stream", and only a reboot
> > recovers the device. The driver probably needs a timeout on that path
> > when the firmware is in this state.
> >
> >
> > 5. I2C bus probing while the ISP is powered
> > --------------------------------------------
> >
> > With a capture pending (ISP powered, after the failed
> > SET_STREAM_CONFIG), on the AMDISP adapter:
> >
> >    i2cdetect -y -r 24:
> >         0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
> >    00:                         -- -- -- -- 0c -- -- --
> >    10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> >    ...
> >    50: 50 -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> >
> >    OV13B10 chip ID (reg 0x300a, 3 bytes) at 0x10 and 0x36:
> >        Remote I/O error at both addresses
> >    EEPROM @0x50, first 32 bytes from offset 0:
> >        01 0b 19 01 11 08 01 01 01 01 00 ... 00 9c 34 be 89
> >    VCM @0x0c: 00 00
> >
> > So the module's EEPROM and VCM are powered and reachable, but the
> > sensor does not ACK at either OV13B10 address.
> >
> > I then drove each amdisp-pinctrl line (GPIO_0/1/2, "sensor0/1/2
> > control") to 1 and to 0 in turn, rescanning the bus each time. Nothing
> > changed: only 0x0c and 0x50 respond in every state.
> >
> >
> > 6. Questions
> > ------------
> >
> > a) Does the current isp_4_1_1.bin support the OV13B10? As far as I can
> >     tell, the host never tells the firmware which sensor is attached,
> >     and there is no in-tree ov05c10 driver in v7.2.8. So I assume the
> >     firmware identifies and programs the sensor itself. Is that
> >     OV05C10-only?
> >
> Currently, the upstreamed isp_4_1_1.bin firmware does not support the
> OV13B10 sensor. Your understanding is correct. There is no in-tree
> OV05C10 driver in the Linux kernel; instead, the firmware is responsible
> for programming and controlling the sensor directly. As a result, the
> current firmware implementation is specific to the OV05C10 sensor and is
> not intended to support other sensor variants.
>=20
> > b) What does isp4fw_error_code 6 mean for SET_STREAM_CONFIG? For
> >     example: sensor not detected, unsupported sensor, or MIPI/PHY setup
> >     failure?
> >
> Error code 6 corresponds to the "UNSUPPORTED_SENSOR" error condition.
>=20
>=20
> > c) GZ302 board data. Which lines control the OV13B10 reset/shutdown and
> >     power rails? Candidates are the amdisp GPIOs, AMDI0030 pins, or
> >     something the firmware drives. Is AMDI0030:00 pin 85 correct for
> >     "enable_isp" on this board? Which clock output feeds the sensor, an=
d
> >     at what rate? The ov13b10 driver expects 19.2 MHz. Which lane count
> >     and link frequency are used?
> >
> sorry, I=E2=80=99m unable to provide the platform configuration for the O=
V13B10
> sensor, as it has not been validated on Linux.
>=20
> > d) Does the firmware enable the sensor clock and power before or
> >     during SET_STREAM_CONFIG? Or does it expect the host (a sensor
> >     driver using the "enable" lookup for i2c-ov05c10) to have powered
> >     the sensor first? Nothing upstream consumes that lookup today.
> >
> As part of processing the SET_STREAM_CONFIG command from host, firmware
> takes care of powering on the sensor and configuring the required
> clocks. Therefore, host is not required to perform any sensor power-on
> operations.
>=20
>=20
> > If OMNI13B1 support is already planned on your side, I am happy to test
> > patches on this machine. If it is easier, I can also provide the full
> > ACPI tables, dmesg with dynamic debug, or other register dumps.
> >
> Thank you for offering your support. We will certainly reach out as we
> make progress on OV13B10 firmware support or when a draft version of the
> sensor-agnostic ISP4 driver becomes available for testing.
>=20
> Thanks,
> Pratap
>=20
> > [1] https://lists.openwall.net/linux-kernel/2025/12/01/84 <https://
> > lists.openwall.net/linux-kernel/2025/12/01/84>
> >
> > Thanks,
> > Caspar Adriani
>=20
> 
