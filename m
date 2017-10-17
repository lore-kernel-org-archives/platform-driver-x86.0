From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v9 10/17] platform/x86: dell-smbios-wmi: Add new WMI
 dispatcher driver
Date: Tue, 17 Oct 2017 21:10:44 +0200
Message-ID: <20171017191044.priqeeymjrewo5hn@pali>
References: <cover.1508259916.git.mario.limonciello@dell.com>
 <911d505461965a47e6ffef7838fdd06a5a7044fd.1508259916.git.mario.limonciello@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <911d505461965a47e6ffef7838fdd06a5a7044fd.1508259916.git.mario.limonciello@dell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mario Limonciello <mario.limonciello@dell.com>
Cc: dvhart@infradead.org, Andy Shevchenko <andy.shevchenko@gmail.com>, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, quasisec@google.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de, Greg KH <greg@kroah.com>, Alan Cox <gnomes@lxorguk.ukuu.org.uk>
List-Id: platform-driver-x86.vger.kernel.org

On Tuesday 17 October 2017 13:21:54 Mario Limonciello wrote:
> +static LIST_HEAD(wmi_list);
> +
> +static inline struct wmi_smbios_priv *get_first_smbios_priv(void)
> +{
> +	return list_first_entry_or_null(&wmi_list,
> +					struct wmi_smbios_priv,
> +					list);
> +}

...

> +int dell_smbios_wmi_call(struct calling_interface_buffer *buffer)
> +{
> +	struct wmi_smbios_priv *priv;
> +	size_t difference;
> +	size_t size;
> +	int ret;
> +
> +	priv = get_first_smbios_priv();

Mutex needs to be acquired before calling this function. Otherwise there
is a race condition between removing element from the list returned by
this call and later usage of structure priv.

> +	if (!priv)
> +		return -ENODEV;
> +
> +	size = sizeof(struct calling_interface_buffer);
> +	difference = priv->req_buf_size - sizeof(u64) - size;
> +
> +	mutex_lock(&call_mutex);
> +	memset(&priv->buf->ext, 0, difference);
> +	memcpy(&priv->buf->std, buffer, size);
> +	ret = run_smbios_call(priv->wdev);
> +	memcpy(buffer, &priv->buf->std, size);
> +	mutex_unlock(&call_mutex);
> +
> +	return ret;
> +}

-- 
Pali Rohár
pali.rohar@gmail.com
