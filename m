From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: Re: [PATCH v4 0/7] Support inhibiting input devices
Date: Mon, 3 Aug 2020 16:40:58 +0200
Message-ID: <8fc3a97d-94b7-e073-3981-2f146f5f209e@collabora.com>
References: <2336e15d-ff4b-bbb6-c701-dbf3aa110fcd@redhat.com>
 <20200608112211.12125-1-andrzej.p@collabora.com>
 <1821a5b7-cbf3-a739-2203-a93b06f0c6f2@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-acpi-owner@vger.kernel.org>
In-Reply-To: <1821a5b7-cbf3-a739-2203-a93b06f0c6f2@redhat.com>
Content-Language: en-US
Sender: linux-acpi-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>, linux-pm@vger.kernel.org, linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-input@vger.kernel.org, linux-tegra@vger.kernel.org, patches@opensource.cirrus.com, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org
Cc: "Rafael J . Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Vladimir Zapolskiy <vz@mleia.com>, Sylvain Lemieux <slemieux.tyco@gmail.com>, Laxman Dewangan <ldewangan@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Barry
List-Id: platform-driver-x86.vger.kernel.org

Hi Dmitry,

W dniu 12.06.2020 o 10:17, Hans de Goede pisze:
> Hi,
> 
> On 6/8/20 1:22 PM, Andrzej Pietrasiewicz wrote:
>> This is a quick respin of v3, with just two small changes, please see
>> the changelog below.
>>
>> Userspace might want to implement a policy to temporarily disregard input
>> from certain devices.
>>

<snip>

>> v3..v4:
>> - updated the comment in input_open_device() (Hans)
>> - used more straightforward locking pattern in adc/exynos (Michał)
>>
>> v2..v3:
>> - ignored autorepeat events in input_get_disposition() if a key is not
>> pressed (Hans)
>> - dropped inhibit()/uninhibit() driver callbacks (Hans)
>> - split ACPI button patch into taking the lock and using the helper (Rafael)
>> - dropped the elan_i2c conversion
>> - fixed typos in exynos adc
>>
>> v1..v2:
>> - added input_device_enabled() helper and used it in drivers (Dmitry)
>> - the fact of open() and close() being called in inhibit/uninhibit paths has
>> been emphasized in the commit message of PATCH 6/7 (Dmitry)

<snip>

> 
> The entire series looks good to me:
> 
> Acked-by: Hans de Goede <hdegoede@redhat.com>

What are the prospects of this series being merged?

Regards,

Andrzej
