From: Azael Avalos <coproscefalo@gmail.com>
Subject: Re: toshiba_acpi.c: Full TOS1900 device support
Date: Sat, 27 Nov 2010 17:44:04 -0700
Message-ID: <AANLkTinaR4MbArfs20xLZMUjTa32sSLZfzRrnApgiGqS@mail.gmail.com>
References: <AANLkTikff5b9zhCLEmyoHZPTPaREuHE1qp21SLA0v=83@mail.gmail.com>
	<20101026192028.GA17880@srcf.ucam.org>
	<AANLkTinmsNzAkp_ZGcaNyVRVMu0Rc4-C+xPKuSOS5jRJ@mail.gmail.com>
	<20101027192913.GA14828@srcf.ucam.org>
	<AANLkTin94udpwFkH+yqH95fu9Q=WCu2u80_DaHHp+zyR@mail.gmail.com>
	<20101124191711.GA6198@srcf.ucam.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-gw0-f46.google.com ([74.125.83.46]:61174 "EHLO
	mail-gw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753725Ab0K1AoG (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 27 Nov 2010 19:44:06 -0500
In-Reply-To: <20101124191711.GA6198@srcf.ucam.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

Hi there,

Sorry for the late reply.

On Wed, Nov 24, 2010 at 12:17 PM, Matthew Garrett <mjg59@srcf.ucam.org> wrote:
> Can you try this (entirely untested) patch and see if it works on your
> system? It's basically your code, but with some of the conditionals
> cleaned up when we already know that information.

The patch works, however, I added a couple lines in order to make it work
on my laptop:

In toshiba_acpi_query_event:
       status = execute_acpi_method(toshiba_acpi.acpi_dev->handle, "INFO",
				    NULL, hotkey);

Here, the handle should be the ACPI device, not the EC

In toshiba_acpi_add:
	/* enable hotkey event */
	hci_write1(HCI_HOTKEY_EVENT, 1, &hci_result);

My model (and a couple others) the ENAB method is empty, and hotkey
activation is done via HCI_HOTKEY_EVENT


Another thing that I've noticed is that "device->device_type" is always zero
for me, I thought that it was supposed to be 1, due to  {"TOS1900", 1}.
So I changed the comparison value to 0 in order to get the hotkeys
reported.


Saludos
Azael


-- 
-- El mundo apesta y vosotros apestais tambien --
