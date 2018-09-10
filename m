From: "Xu, Pinzhen" <pinzhen.xu@intel.com>
Subject: Memory leak in dell-smbios-wmi.c
Date: Mon, 10 Sep 2018 02:45:12 +0000
Message-ID: <9B08B519B25F86498FA0D010F395E43DED0AD3@shsmsx102.ccr.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

There might be a possible memory leak in drivers/platform/x86/dell-smbios-wmi.c
In the `run_smbios_call' function, the buffer created via ACPI_ALLOCATE_BUFFER
within the output object is not freed properly.


Generally, this buffer should be freed using:
  kfree(output.pointer);


But it hasn't been cleaned up after a `memcpy' being done.
static int run_smbios_call(struct wmi_device *wdev)
{
      struct acpi_buffer output = {ACPI_ALLOCATE_BUFFER, NULL};
      struct wmi_smbios_priv *priv;
      struct acpi_buffer input;
      union acpi_object *obj;
      acpi_status status;

      priv = dev_get_drvdata(&wdev->dev);
      input.length = priv->req_buf_size - sizeof(u64);
      input.pointer = &priv->buf->std;

      dev_dbg(&wdev->dev, "evaluating: %u/%u [%x,%x,%x,%x]\n",
            priv->buf->std.cmd_class, priv->buf->std.cmd_select,
            priv->buf->std.input[0], priv->buf->std.input[1],
            priv->buf->std.input[2], priv->buf->std.input[3]);

      status = wmidev_evaluate_method(wdev, 0, 1, &input, &output);
      if (ACPI_FAILURE(status))
            return -EIO;
      obj = (union acpi_object *)output.pointer;
      if (obj->type != ACPI_TYPE_BUFFER) {
            dev_dbg(&wdev->dev, "received type: %d\n", obj->type);
            if (obj->type == ACPI_TYPE_INTEGER)
                  dev_dbg(&wdev->dev, "SMBIOS call failed: %llu\n",
                        obj->integer.value);
            return -EIO;
      }
      memcpy(&priv->buf->std, obj->buffer.pointer, obj->buffer.length);
      dev_dbg(&wdev->dev, "result: [%08x,%08x,%08x,%08x]\n",
            priv->buf->std.output[0], priv->buf->std.output[1],
            priv->buf->std.output[2], priv->buf->std.output[3]);

      return 0;
}


Found with kmemleak:
unreferenced object 0xffff8f79382e0000 (size 8192):
  comm "fwupd", pid 3467, jiffies 4294967131 (age 265623.160s)
  hex dump (first 32 bytes):
    03 00 00 00 00 10 00 00 18 00 2e 38 79 8f ff ff  ...........8y...
    00 00 00 00 00 00 00 00 11 00 16 00 00 00 00 00  ................
  backtrace:
    [<0000000000d8a77d>] __kmalloc+0x14e/0x240
    [<00000000affbc59b>] acpi_os_allocate+0x27/0x29
    [<000000003fd4a388>] acpi_ut_initialize_buffer+0x3f/0x73
    [<0000000027ecea33>] acpi_evaluate_object+0x22b/0x3aa
    [<00000000e26b12ce>] wmidev_evaluate_method+0x114/0x150 [wmi]
    [<00000000ccecc6ff>] run_smbios_call+0x6d/0x190 [dell_smbios]
    [<00000000e8e58b51>] dell_smbios_wmi_filter+0x71/0xd0 [dell_smbios]
    [<00000000c3818758>] wmi_ioctl+0x100/0x232 [wmi]
    [<00000000cbfe4a18>] do_vfs_ioctl+0xa8/0x620
    [<0000000035f23e13>] ksys_ioctl+0x67/0x90
    [<00000000b3776114>] __x64_sys_ioctl+0x1a/0x20
    [<00000000477604b1>] do_syscall_64+0x5a/0x110
    [<00000000a6b58460>] entry_SYSCALL_64_after_hwframe+0x44/0xa9
    [<00000000fa4ff21e>] 0xffffffffffffffff
