From: Jun Li <jun.li@nxp.com>
Subject: RE: [PATCH v5 01/12] drivers: base: Unified device connection lookup
Date: Thu, 1 Mar 2018 00:56:57 +0000
Message-ID: <VI1PR0402MB3917DD93F114873CC736117389C60@VI1PR0402MB3917.eurprd04.prod.outlook.com>
References: <20180228150749.26831-1-hdegoede@redhat.com>
 <20180228150749.26831-2-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180228150749.26831-2-hdegoede@redhat.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Mathias Nyman <mathias.nyman@intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Guenter Roeck <linux@roeck-us.net>
Cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

Hi,
> -----Original Message-----

> +struct device *device_find_connection(struct device *dev, const char
> +*con_id) {
> +	return __device_find_connection(dev, con_id, generic_match, NULL); }

-       return __device_find_connection(dev, con_id, generic_match, NULL);
+       return __device_find_connection(dev, con_id, NULL, generic_match);

Jun Li
> +EXPORT_SYMBOL_GPL(device_find_connection);
