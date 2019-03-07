From: David Laight <David.Laight@ACULAB.COM>
Subject: RE: [PATCH] platform/x86: thinkpad_acpi: disable bluetooth for some
 machines
Date: Thu, 7 Mar 2019 17:00:35 +0000
Message-ID: <4801d0ea91ac46888b11d924b9508d1e@AcuMS.aculab.com>
References: <20190307080820.9723-1-jiaxun.yang@flygoat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20190307080820.9723-1-jiaxun.yang@flygoat.com>
Content-Language: en-US
Sender: stable-owner@vger.kernel.org
To: 'Jiaxun Yang' <jiaxun.yang@flygoat.com>, "ibm-acpi@hmh.eng.br" <ibm-acpi@hmh.eng.br>
Cc: "dvhart@infradead.org" <dvhart@infradead.org>, "andy@infradead.org" <andy@infradead.org>, "ibm-acpi-devel@lists.sourceforge.net" <ibm-acpi-devel@lists.sourceforge.net>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "stable@vger.kernel.org" <stable@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

From: Jiaxun Yang
> Sent: 07 March 2019 08:08
...
> +static int __init have_bt_fwbug(void)
> +{
> +	/* Some AMD based ThinkPads have a firmware bug that calling
> +	 * "GBDC" will cause bluetooth on Intel wireless cards blocked
> +	 */
> +	if (dmi_check_system(bt_fwbug_list)) {
> +		if (pci_get_device(PCI_VENDOR_ID_INTEL, 0x24F3, NULL) || \

WTF if that \ ??

> +		    pci_get_device(PCI_VENDOR_ID_INTEL, 0x24FD, NULL) || \
> +		    pci_get_device(PCI_VENDOR_ID_INTEL, 0x2526, NULL))
> +			return 1;
> +		else
> +			return 0;
> +	} else {
> +			return 0;
> +	}
> +}

You don't need 'else' after a 'return'.
I'd also put the return nearer the test.

While the above could be written:
	return dmi_check_system(bt_fwbug_list) &&
		(pci_get_device(PCI_VENDOR_ID_INTEL, 0x24F3, NULL) ||
		pci_get_device(PCI_VENDOR_ID_INTEL, 0x24FD, NULL) ||
		pci_get_device(PCI_VENDOR_ID_INTEL, 0x2526, NULL));

I think I'd write:
	if (!dmi_check_system(bt_fwbug_list))
		return 0;
	return pci_get_device(PCI_VENDOR_ID_INTEL, 0x24F3, NULL) ||
		pci_get_device(PCI_VENDOR_ID_INTEL, 0x24FD, NULL) ||
		pci_get_device(PCI_VENDOR_ID_INTEL, 0x2526, NULL);

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)
