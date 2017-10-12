From: kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH v6 14/14] platform/x86: dell-smbios-wmi: introduce
 userspace interface
Date: Thu, 12 Oct 2017 09:16:25 +0800
Message-ID: <201710120948.TtnudXQQ%fengguang.wu@intel.com>
References: <411980beb5697e312145ef268516f4cc7c585b8f.1507589249.git.mario.limonciello@dell.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="SUOF0GtieIMvvwua"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga14.intel.com ([192.55.52.115]:3903 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751350AbdJLBRO (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 11 Oct 2017 21:17:14 -0400
Content-Disposition: inline
In-Reply-To: <411980beb5697e312145ef268516f4cc7c585b8f.1507589249.git.mario.limonciello@dell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
Cc: kbuild-all@01.org, dvhart@infradead.org, Andy Shevchenko <andy.shevchenko@gmail.com>, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, quasisec@google.com, pali.rohar@gmail.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de, Greg KH <greg@kroah.com>, Mario Limonciello <mario.limonciello@dell.com>


--SUOF0GtieIMvvwua
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mario,

[auto build test WARNING on platform-drivers-x86/for-next]
[also build test WARNING on next-20171009]
[cannot apply to v4.14-rc4]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

url:    https://github.com/0day-ci/linux/commits/Mario-Limonciello/Introduce-support-for-Dell-SMBIOS-over-WMI/20171012-082742
base:   git://git.infradead.org/users/dvhart/linux-platform-drivers-x86.git for-next
config: x86_64-randconfig-x018-201741 (attached as .config)
compiler: gcc-6 (Debian 6.2.0-3) 6.2.0 20160901
reproduce:
        # save the attached .config to linux build tree
        make ARCH=x86_64 

All warnings (new ones prefixed by >>):

   In file included from include/linux/kobject.h:21:0,
                    from include/linux/dmi.h:5,
                    from drivers/platform/x86/dell-smbios-wmi.c:12:
   drivers/platform/x86/dell-smbios-wmi.c: In function 'dell_smbios_wmi_probe':
   include/linux/sysfs.h:54:8: error: 'struct device_attribute' has no member named 'key'
     (attr)->key = &__key;    \
           ^
>> drivers/platform/x86/dell-smbios-wmi.c:207:2: note: in expansion of macro 'sysfs_attr_init'
     sysfs_attr_init(&priv->req_buf_size_attr);
     ^~~~~~~~~~~~~~~

vim +/sysfs_attr_init +207 drivers/platform/x86/dell-smbios-wmi.c

    11	
  > 12	#include <linux/dmi.h>
    13	#include <linux/list.h>
    14	#include <linux/module.h>
    15	#include <linux/mutex.h>
    16	#include <linux/uaccess.h>
    17	#include <linux/wmi.h>
    18	#include <uapi/linux/dell-smbios.h>
    19	#include "dell-smbios.h"
    20	#include "dell-wmi-descriptor.h"
    21	static DEFINE_MUTEX(call_mutex);
    22	static DEFINE_MUTEX(list_mutex);
    23	static int wmi_supported;
    24	
    25	struct misc_bios_flags_structure {
    26		struct dmi_header header;
    27		u16 flags0;
    28	} __packed;
    29	#define FLAG_HAS_ACPI_WMI 0x02
    30	
    31	#define DELL_WMI_SMBIOS_GUID "A80593CE-A997-11DA-B012-B622A1EF5492"
    32	
    33	struct wmi_smbios_priv {
    34		struct wmi_smbios_buffer *buf;
    35		struct device_attribute req_buf_size_attr;
    36		struct list_head list;
    37		struct wmi_device *wdev;
    38		struct device *child;
    39		u32 req_buf_size;
    40	};
    41	static LIST_HEAD(wmi_list);
    42	
    43	static inline struct wmi_smbios_priv *get_first_smbios_priv(void)
    44	{
    45		return list_first_entry_or_null(&wmi_list,
    46						struct wmi_smbios_priv,
    47						list);
    48	}
    49	
    50	static int run_smbios_call(struct wmi_device *wdev)
    51	{
    52		struct acpi_buffer output = {ACPI_ALLOCATE_BUFFER, NULL};
    53		struct wmi_smbios_priv *priv;
    54		struct acpi_buffer input;
    55		union acpi_object *obj;
    56		acpi_status status;
    57	
    58		priv = dev_get_drvdata(&wdev->dev);
    59		input.length = priv->req_buf_size;
    60		input.pointer = &priv->buf->std;
    61	
    62		dev_dbg(&wdev->dev, "evaluating: %x/%x [%x,%x,%x,%x]\n",
    63			priv->buf->std.class, priv->buf->std.select,
    64			priv->buf->std.input[0], priv->buf->std.input[1],
    65			priv->buf->std.input[2], priv->buf->std.input[3]);
    66	
    67		status = wmidev_evaluate_method(wdev, 0, 1, &input, &output);
    68		if (ACPI_FAILURE(status))
    69			return -EIO;
    70		obj = (union acpi_object *)output.pointer;
    71		if (obj->type != ACPI_TYPE_BUFFER) {
    72			dev_dbg(&wdev->dev, "received type: %d\n", obj->type);
    73			if (obj->type == ACPI_TYPE_INTEGER)
    74				dev_dbg(&wdev->dev, "SMBIOS call failed: %llu\n",
    75					obj->integer.value);
    76			return -EIO;
    77		}
    78		memcpy(&priv->buf->std, obj->buffer.pointer, obj->buffer.length);
    79	
    80		return 0;
    81	}
    82	
    83	int dell_smbios_wmi_call(struct calling_interface_buffer *buffer)
    84	{
    85		struct wmi_smbios_priv *priv;
    86		size_t difference;
    87		size_t size;
    88		int ret;
    89	
    90		priv = get_first_smbios_priv();
    91		if (!priv)
    92			return -ENODEV;
    93	
    94		size = sizeof(struct calling_interface_buffer);
    95		difference = priv->req_buf_size - sizeof(u64) - size;
    96	
    97		mutex_lock(&call_mutex);
    98		memset(&priv->buf->ext, 0, difference);
    99		memcpy(&priv->buf->std, buffer, size);
   100		ret = run_smbios_call(priv->wdev);
   101		memcpy(buffer, &priv->buf->std, size);
   102		mutex_unlock(&call_mutex);
   103	
   104		return ret;
   105	}
   106	
   107	static long dell_smbios_wmi_ioctl(struct wmi_device *wdev, unsigned int cmd,
   108					  unsigned long arg)
   109	{
   110		struct wmi_smbios_buffer __user *input =
   111			(struct wmi_smbios_buffer __user *) arg;
   112		struct wmi_smbios_priv *priv;
   113		int ret = 0;
   114		u64 size;
   115	
   116		switch (cmd) {
   117		case DELL_WMI_SMBIOS_CMD:
   118			priv = dev_get_drvdata(&wdev->dev);
   119			if (!priv)
   120				return -ENODEV;
   121			mutex_lock(&call_mutex);
   122			/* read the size that userspace is sending */
   123			if (get_user(size, &input->length)) {
   124				dev_dbg(&wdev->dev, "Read length from user failed\n");
   125				ret = -EFAULT;
   126				goto fail_smbios_cmd;
   127			}
   128			/* if it's too big, this is OK, we'll only use what we need */
   129			if (size > priv->req_buf_size)
   130				dev_warn(&wdev->dev,
   131					"Buffer %lld is bigger than required %d\n",
   132					size, priv->req_buf_size);
   133			/* if it's too small, abort */
   134			if (size < priv->req_buf_size) {
   135				dev_err(&wdev->dev,
   136					"Buffer %lld too small, need at least %d\n",
   137					size, priv->req_buf_size);
   138				ret = -EINVAL;
   139				goto fail_smbios_cmd;
   140			}
   141			/* read the structure from userspace */
   142			if (copy_from_user(priv->buf, input, priv->req_buf_size)) {
   143				dev_dbg(&wdev->dev, "Copy %llu from user failed\n",
   144					size);
   145				ret = -EFAULT;
   146				goto fail_smbios_cmd;
   147			}
   148			/* check for any calls we should avoid */
   149			if (dell_smbios_call_filter(&wdev->dev, &priv->buf->std)) {
   150				dev_err(&wdev->dev, "Invalid call %d/%d:%8x\n",
   151					priv->buf->std.class, priv->buf->std.select,
   152					priv->buf->std.input[0]);
   153				ret = -EFAULT;
   154				goto fail_smbios_cmd;
   155			}
   156			ret = run_smbios_call(priv->wdev);
   157			if (ret != 0)
   158				goto fail_smbios_cmd;
   159			/* return the result (only up to our internal buffer size) */
   160			if (copy_to_user(input, priv->buf, priv->req_buf_size)) {
   161				dev_dbg(&wdev->dev, "Copy %d to user failed\n",
   162				priv->req_buf_size);
   163				ret = -EFAULT;
   164			}
   165	fail_smbios_cmd:
   166			mutex_unlock(&call_mutex);
   167			break;
   168		default:
   169			dev_dbg(&wdev->dev, "unsupported ioctl: %d [%d, %d, %d, %d].\n",
   170				cmd, _IOC_DIR(cmd), _IOC_TYPE(cmd), _IOC_NR(cmd),
   171				_IOC_SIZE(cmd));
   172			ret = -ENOIOCTLCMD;
   173		}
   174		return ret;
   175	}
   176	
   177	static ssize_t req_buf_size_show(struct device *dev,
   178					struct device_attribute *attr, char *buf)
   179	{
   180		struct wmi_smbios_priv *priv = dev_get_drvdata(dev);
   181	
   182		return sprintf(buf, "%d\n", priv->req_buf_size);
   183	}
   184	
   185	static int dell_smbios_wmi_probe(struct wmi_device *wdev)
   186	{
   187		struct wmi_smbios_priv *priv;
   188		int count;
   189		int ret;
   190	
   191		priv = devm_kzalloc(&wdev->dev, sizeof(struct wmi_smbios_priv),
   192				    GFP_KERNEL);
   193		if (!priv)
   194			return -ENOMEM;
   195	
   196		/* WMI buffer size will be either 4k or 32k depending on machine */
   197		if (!dell_wmi_get_size(&priv->req_buf_size))
   198			return -EINVAL;
   199		/* add in the length object we will use internally with ioctl */
   200		priv->req_buf_size += sizeof(u64);
   201	
   202		count = get_order(priv->req_buf_size);
   203		priv->buf = (void *)__get_free_pages(GFP_KERNEL, count);
   204		if (!priv->buf)
   205			return -ENOMEM;
   206	
 > 207		sysfs_attr_init(&priv->req_buf_size_attr);
   208		priv->req_buf_size_attr.attr.name = "required_buffer_size";
   209		priv->req_buf_size_attr.attr.mode = 0444;
   210		priv->req_buf_size_attr.show = req_buf_size_show;
   211	
   212		ret = device_create_file(&wdev->dev, &priv->req_buf_size_attr);
   213		if (ret)
   214			goto fail_create_sysfs;
   215	
   216		/* ID is used by dell-smbios to set priority of drivers */
   217		wdev->dev.id = 1;
   218		ret = dell_smbios_register_device(&wdev->dev, &dell_smbios_wmi_call);
   219		if (ret)
   220			goto fail_register;
   221	
   222		priv->wdev = wdev;
   223		dev_set_drvdata(&wdev->dev, priv);
   224		mutex_lock(&list_mutex);
   225		list_add_tail(&priv->list, &wmi_list);
   226		mutex_unlock(&list_mutex);
   227	
   228		return 0;
   229	
   230	fail_register:
   231		device_remove_file(&wdev->dev, &priv->req_buf_size_attr);
   232	
   233	fail_create_sysfs:
   234		free_pages((unsigned long)priv->buf, count);
   235		return ret;
   236	}
   237	

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

--SUOF0GtieIMvvwua
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--SUOF0GtieIMvvwua--
